import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TextEditingController _controller = TextEditingController();

  List<TodoItem> _todoItem = [
    TodoItem(title: '플러터공부'),
    TodoItem(title: '낮잠 자기', isDone: false), // bool 타입으로 수정
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter todo item...',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      // 텍스트가 비어있지 않을 때만 추가
                      if (_controller.text.isNotEmpty) {
                        _todoItem.add(TodoItem(title: _controller.text));
                        _controller.clear();
                      }
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            // ListView.builder를 Expanded로 감싸기
            child: ListView.builder(
              itemCount: _todoItem.length,
              itemBuilder: (context, index) {
                // 쉼표 추가
                final item = _todoItem[index];
                return ListTile(
                  title: Text(item.title), // 현재 인덱스의 항목 표시
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      setState(() {
                        // UI 업데이트를 위해 setState 추가
                        _todoItem[index].isDone = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 메모리 누수 방지
    super.dispose();
  }
}
