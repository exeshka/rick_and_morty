import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardPerson extends StatelessWidget {
  final PersonEntity person;
  const CardPerson({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: person.image,
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                        title: Text(
                          'Имя',
                          style: TextStyle(
                              fontSize: 18, color: Theme.of(context).hintColor),
                        ),
                        subtitle: Text(
                          person.name,
                          style: TextStyle(fontSize: 23),
                        ),
                        trailing: Text(
                          person.species,
                          style: TextStyle(fontSize: 23),
                        )),
                    ListTile(
                      title: Text(
                        'Гендер',
                        style: TextStyle(
                            fontSize: 18, color: Theme.of(context).hintColor),
                      ),
                      subtitle: Text(
                        person.gender,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Тип',
                        style: TextStyle(
                            fontSize: 18, color: Theme.of(context).hintColor),
                      ),
                      subtitle: Text(
                        person.type == '' ? 'Неизвестный' : person.type,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Локация',
                        style: TextStyle(
                            fontSize: 18, color: Theme.of(context).hintColor),
                      ),
                      subtitle: Text(
                        person.location.name,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),

                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            height: 150,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    // Add more information here if needed
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
