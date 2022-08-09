import 'package:dnd_partyfinder/r_p_g_icons_icons.dart';
import 'package:dnd_partyfinder/views/components/card_player_information.dart';
import 'package:dnd_partyfinder/views/components/draggable_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.7;
    var cardWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: CircleAvatar(child: Image.asset("assets/dnd-icon.png")),
      ),
      body: DraggableCard(
        child: SizedBox(
          height: cardHeight,
          width: cardWidth,
          child: CardPlayerInformation(
            height: cardHeight,
            width: cardWidth,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(RPGIcons.player), label: ""),
          BottomNavigationBarItem(icon: Icon(RPGIcons.hood), label: "")
        ],
      ),
    );
  }
}
