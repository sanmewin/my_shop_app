import 'package:flutter/material.dart';

class SizeListView extends StatefulWidget {
  const SizeListView({Key? key}) : super(key: key);

  @override
  State<SizeListView> createState() => _SizeListViewState();
}

class _SizeListViewState extends State<SizeListView> {
  List<String> sizes = ['s', 'm', 'l', 'xl'];
  bool isSelected = false;
  int selectedIndex = 0;
  int? choiceIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: sizes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ChoiceChip(
                label: Text(sizes[index]),
                selected: choiceIndex == index,
                selectedColor: Colors.black,
                onSelected: (bool isChoiced) {
                  setState(() {
                    choiceIndex = isChoiced ? index : null;
                  });
                },
                backgroundColor: Colors.grey.shade400,
                labelStyle: TextStyle(color: Colors.white),
              ));
        },
      ),
    );
  }
}
