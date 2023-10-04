import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, String>> fakePeopleList = [
    {
      "name": "John",
      "imageUrl": "http://placebeard.it/g/640/480",
      "message": "Hello Anthony !"
    },
    {
      "name": "Alice",
      "imageUrl": "",
      "message": "I'd like to set an appointment for next Friday"
    },
    {
      "name": "Bob",
      "imageUrl": "http://placebeard.it/600/420",
      "message": "I'm looking forward to work with you !"
    },
    {
      "name": "Eva",
      "imageUrl": "",
      "message": "My boss was impressed 😎"
    },
    {
      "name": "Casius",
      "imageUrl": "http://placebeard.it/560/500",
      "message": "Ok have a good week-end !"
    },
    {
      "name": "Charly",
      "imageUrl": "http://placebeard.it/450/500",
      "message": "Hello Anthony !"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Container(
                  height: 100, // Hauteur de la rangée
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fakePeopleList.length,
                    itemBuilder: (context, index) {
                      String name = fakePeopleList[index]['name']!;
                      String imageUrl = fakePeopleList[index]['imageUrl']!;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                          ),
                          Text(name),
                        ],
                      );
                    },
                  ),
                ),
              ),
              // Ajoutez d'autres éléments positionnés au besoin
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                String? name = fakePeopleList[index]['name']!;
                String? imageUrl = fakePeopleList[index]['imageUrl']!;
                String? lastMessage = fakePeopleList[index]['message']!;
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  title: Text(name),
                  subtitle: Text(lastMessage),
                  onTap: () {
                    // go to chat page
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // L'index de la page actuelle
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
