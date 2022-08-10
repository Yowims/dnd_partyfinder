import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CardPlayerInformation extends StatelessWidget {
  final faker = Faker();

  final double height;
  final double width;
  CardPlayerInformation({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                faker.image.image(
                    width: width.round(),
                    height: height.round(),
                    keywords: ["selfie"],
                    random: true),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color.fromRGBO(0, 0, 0, 0.5), Colors.transparent],
                    stops: [0.7, 1]),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      faker.person.name(),
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              child: Icon(Icons.description),
            ),
          ),
        ),
      ],
    );
  }
}
