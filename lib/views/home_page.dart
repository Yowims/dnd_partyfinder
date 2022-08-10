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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final greenOpacity = 0.8;
  final redOpacity = 0.8;
  double opacity = 0.0;

  late AnimationController _controller;
  late Animation<double> _animation;
  late ValueNotifier<double> opacityObservable = ValueNotifier<double>(opacity);

  void _runAnimation() {
    _animation = _controller.drive(Tween<double>(begin: opacity, end: 0.0));

    _controller.reset();
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        opacity = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.7;
    var cardWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: CircleAvatar(child: Image.asset("assets/dnd-icon.png")),
      ),
      body: Stack(
        children: [
          DraggableCard(
            child: SizedBox(
              height: cardHeight,
              width: cardWidth,
              child: GestureDetector(
                onPanDown: (details) {
                  _controller.stop();
                },
                onPanUpdate: (details) {
                  setState(() {
                    opacity = (MediaQuery.of(context).size.width -
                            details.globalPosition.dx) /
                        MediaQuery.of(context).size.width;
                  });
                },
                onPanEnd: (details) {
                  _runAnimation();
                },
                child: CardPlayerInformation(
                  height: cardHeight,
                  width: cardWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(opacity != 0 ? opacity : 0)),
              width: MediaQuery.of(context).size.width * .2,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  RPGIcons.cancel,
                  color: Colors.white.withOpacity(opacity != 0 ? opacity : 0),
                  size: 64,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color:
                      Colors.green.withOpacity(opacity != 0 ? 1 - opacity : 0)),
              width: MediaQuery.of(context).size.width * .2,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  RPGIcons.all_for_one,
                  color:
                      Colors.white.withOpacity(opacity != 0 ? 1 - opacity : 0),
                  size: 64,
                ),
              ),
            ),
          )
        ],
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
