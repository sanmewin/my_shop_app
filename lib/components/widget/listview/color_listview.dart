import 'package:flutter/material.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  Color color = const Color(0xffAF7AB3);
  List<Color> colors = [
    const Color(0xffAF7AB3),
    const Color(0xff94B49F),
    const Color(0xff937DC2),
    const Color(0xffFFCC8F),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  color = colors[index];
                  selectedIndex = index;
                });
              },
              child: CircleAvatar(
                radius: 14,
                backgroundColor:
                    selectedIndex == index ? Colors.black : colors[index],
                child: CircleAvatar(
                  backgroundColor: colors[index],
                  radius: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
