import 'package:flutter/material.dart';

class AppItem extends StatelessWidget {
  const AppItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Adicione um item a lista',
                border: UnderlineInputBorder(),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.grey, size: 30),
                onPressed: () {
                  // Ação do botão
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
