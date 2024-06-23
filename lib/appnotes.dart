import 'package:flutter/material.dart';
import 'appitem.dart'; // Importe o arquivo appitem.dart onde está definido o widget AppItem

class AppNotes extends StatefulWidget {
  const AppNotes({super.key});

  @override
  _AppNotesState createState() => _AppNotesState();
}

class _AppNotesState extends State<AppNotes> {
  List<Map<String, dynamic>> data = [
    {
      'title': 'Comidinhas Love ❤️',
      'data': ['Pizza', 'Burger', 'Risotto'],
    },
    {
      'title': 'Hora do filme!',
      'data': ['French Fries', 'Onion Rings', 'Fried Shrimps'],
    },
    {
      'title': 'Bebidinhas',
      'data': ['Water', 'Coke', 'Beer'],
    },
    {
      'title': 'Docinho Time!',
      'data': ['Cheese Cake', 'Ice Cream'],
    },
  ];

  // Mapa para controlar o estado dos checkboxes
  Map<String, Map<String, bool>> itemCheckedState = {};

  @override
  void initState() {
    super.initState();
    // Inicializa o mapa de estado dos checkboxes com todos os itens inicialmente desmarcados
    for (int i = 0; i < data.length; i++) {
      Map<String, bool> map = {};
      for (String item in data[i]['data']) {
        map[item] = false;
      }
      itemCheckedState[data[i]['title']] = map;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        String title = data[index]['title'];
        List<String> items = List<String>.from(data[index]['data']);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( // Margem vertical
              padding: const EdgeInsets.all(1.0), // Padding
              margin: const EdgeInsets.only(top: 20.0), // Margem superior de 20
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_sweep_outlined),
                  onPressed: () {
                    setState(() {
                      data.removeAt(index);
                    });
                  },
                ),
              ),
            ),
            // Adicione o widget AppItem após o ListView.builder de items
            const AppItem(), // Supondo que AppItem seja o widget que você deseja adicionar
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int itemIndex) {
                String item = items[itemIndex];
                bool isChecked = itemCheckedState[title]?[item] ?? false;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 1.0), // Margem vertical
                  padding: const EdgeInsets.all(1.0), // Padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!), // Raio da borda
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          itemCheckedState[title]?[item] = value ?? false;
                        });
                      },
                      checkColor: Colors.white, // Cor do ícone de marcação (tick)
                      activeColor: Colors.green, // Cor do círculo do checkbox quando marcado
                    ),
                    title: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 20, // Tamanho do texto
                        color: Colors.black54, // Cor do texto
                      ),                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.red, // Cor do ícone
                      ),
                      onPressed: () {
                        setState(() {
                          items.removeAt(itemIndex);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}