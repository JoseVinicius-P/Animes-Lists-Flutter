import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
        children: [
          Center(
            child: Text(
              'Deu',
            ),
          )
        ],
      );
  }
}
