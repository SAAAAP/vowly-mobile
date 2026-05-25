import 'package:flutter/material.dart';

import '../../core/services/checklist_service.dart';

class WeddingChecklistScreen extends StatefulWidget {
  const WeddingChecklistScreen({super.key});

  @override
  State<WeddingChecklistScreen> createState() =>
      _WeddingChecklistScreenState();
}

class _WeddingChecklistScreenState
    extends State<WeddingChecklistScreen> {

  List checklist = [];

  bool isLoading = true;

  final titleController = TextEditingController();

  Future fetchChecklist() async {

    final response = await ChecklistService()
        .getChecklist(1);

    setState(() {
      checklist = response;
      isLoading = false;
    });
  }

  Future addChecklist() async {

    await ChecklistService().createChecklist(
      brideId: 1,
      title: titleController.text,
    );

    titleController.clear();

    fetchChecklist();
  }

  Future toggleChecklist(int id) async {

    await ChecklistService().toggleChecklist(id);

    fetchChecklist();
  }

  @override
  void initState() {
    super.initState();

    fetchChecklist();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Wedding Checklist',
        ),
      ),

      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(

              children: [

                Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'New checklist item',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          if (titleController.text.trim().isNotEmpty) {
                            addChecklist();
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: checklist.isEmpty
                      ? const Center(
                          child: Text('No checklist items yet.'),
                        )
                      : ListView.builder(
                          itemCount: checklist.length,
                          itemBuilder: (context, index) {
                            final item = checklist[index];
                            final completed = item['completed'] as bool? ?? false;
                            return ListTile(
                              leading: Checkbox(
                                value: completed,
                                onChanged: (_) => toggleChecklist(item['id'] as int),
                              ),
                              title: Text(item['title'] ?? ''),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
