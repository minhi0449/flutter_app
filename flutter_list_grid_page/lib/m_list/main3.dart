import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/main.dart';

// ListView 와 ListTile 위젯을 살펴 보자.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text('${index + 1}',
                      style: TextStyle(color: Colors.white)),
                ),
                title: Text('${index + 1} Item'),
                subtitle: Text('${index + 1} Item des...'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.access_time_filled_outlined)),
              );
            },
            separatorBuilder: (BuildContext, index) {
              return Divider(
                height: 1, // 높이
                color: Colors.black54,
                indent: 10,
                endIndent: 10,
                thickness: 1.0, // 선의 두께
              );
            },
            itemCount: 20),
      ),
    );
  }
}
