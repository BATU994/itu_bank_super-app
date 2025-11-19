import 'package:bank_application/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../models/transaction.dart';

class TransfersScreen extends ConsumerStatefulWidget {
  const TransfersScreen({super.key});
  @override
  ConsumerState<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends ConsumerState<TransfersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _amount = 0;
  final _formKey = GlobalKey<FormState>();
  String _target = '';
  bool _isSending = false;
  String? _error;
  bool _showSuspicious = false;
  static const suspiciousLimit = 200000;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void _submit() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _error = null;
      _isSending = true;
    });
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() {
        _isSending = false;
      });
      return;
    }
    _formKey.currentState!.save();
    final balance = ref.read(balanceProvider);
    if (_amount > balance) {
      setState(() {
        _isSending = false;
        _error = l10n.insufficientFunds;
      });
      return;
    }
    if (_amount > suspiciousLimit) {
      setState(() {
        _showSuspicious = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 700));
    ref.read(balanceProvider.notifier).state = balance - _amount;
    ref
        .read(transactionsProvider.notifier)
        .add(
          BankTransaction(
            date: DateTime.now(),
            type: TransactionType.transfer,
            from: 'Me',
            to: _target,
            amount: _amount,
            currency: '₸',
            description: 'Transfer to $_target',
          ),
        );
    if (mounted) {
      setState(() {
        _isSending = false;
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(l10n.success),
          content: Text(l10n.transactionSuccess),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.ok),
            ),
          ],
        ),
      );
    }
  }

  void _showAiAssistant(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        String reply = '';
        bool sent = false;
        return StatefulBuilder(
          builder: (context, setSheetState) => Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "AI Payment Assistant",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: "Ask a question (e.g. 'How do transfers work?')",
                  ),
                  onSubmitted: (_) async {
                    setSheetState(() => sent = true);
                    await Future.delayed(const Duration(milliseconds: 700));
                    setSheetState(
                      () => reply =
                          'You can send money instantly by filling the transfer form. Make sure you have enough balance!',
                    );
                  },
                ),
                const SizedBox(height: 14),
                if (sent && reply.isEmpty) const CircularProgressIndicator(),
                if (reply.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      reply,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final balance = ref.watch(balanceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.transfers),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.toAccount),
            Tab(text: l10n.toCard),
            Tab(text: l10n.multiCurrency),
          ],
        ),
      ),
      body: Column(
        children: [
          if (_showSuspicious)
            Container(
              width: double.infinity,
              color: Colors.orange.shade200,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.deepOrange),
                  const SizedBox(width: 8),
                  Expanded(child: Text('Suspicious activity detected')),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('${l10n.totalBalance}: ₸${balance.toStringAsFixed(0)}'),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.toAccount),
                    onSaved: (v) => _target = v ?? '',
                    validator: (v) =>
                        (v == null || v.isEmpty) ? l10n.invalidInput : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.amount),
                    keyboardType: TextInputType.number,
                    onSaved: (v) => _amount = double.tryParse(v ?? '0') ?? 0,
                    validator: (v) => ((double.tryParse(v ?? '') ?? 0) <= 0)
                        ? l10n.invalidInput
                        : null,
                  ),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 18),
                  _isSending
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            child: Text(l10n.send),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('AI Assistant'),
        icon: const Icon(Icons.smart_toy),
        onPressed: () => _showAiAssistant(context),
      ),
    );
  }
}
