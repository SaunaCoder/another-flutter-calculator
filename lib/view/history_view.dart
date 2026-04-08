import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final DBHelper _dbHelper = DBHelper();
  List<Map<String, dynamic>> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final data = await _dbHelper.getHistory();
    setState(() {
      _history = data;
    });
  }

  Future<void> _clearHistory() async {
    await _dbHelper.clearHistory();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Calculation History"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: _history.isEmpty
          ? const Center(
              child: Text(
                "No history yet",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _history.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final item = _history[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  title: Text(
                    item['calculation'],
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    item['timestamp'],
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                );
              },
            ),
    );
  }
}
