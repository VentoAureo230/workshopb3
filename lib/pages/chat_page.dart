import 'package:firebase_auth/firebase_auth.dart';
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
      "imageUrl": "https://static3.cegos.fr/content/uploads/2019/09/09165214/business-unit-manager.jpg.webp",
      "message": "Hello Anthony !"
    },
    {
      "name": "Alice",
      "imageUrl": "https://us.123rf.com/450wm/dmitryag/dmitryag2307/dmitryag230700586/207829432-beaut%C3%A9-femme-africaine-moderne-sourire-visage-attrayant-affaires-adulte-am%C3%A9ricain-portrait-style-de.jpg?ver=6",
      "message": "I'd like to set an appointment for next Friday"
    },
    {
      "name": "Bob",
      "imageUrl": "https://www.simplilearn.com/ice9/free_resources_article_thumb/How_to_become_a_marketing_managerjghf.jpg",
      "message": "I'm looking forward to work with you !"
    },
    {
      "name": "Eva",
      "imageUrl": "https://wappoint.co.za/wp-content/uploads/2021/08/5-Ways-to-succeed-as-a-woman-entrepreneur.jpg",
      "message": "My boss was impressed 😎"
    },
    {
      "name": "Casius",
      "imageUrl": "https://pml.com.ng/wp-content/uploads/2015/05/Black-Business-Man.jpg",
      "message": "Ok have a good week-end !"
    },
    {
      "name": "Charly",
      "imageUrl": "https://cdn.stocksnap.io/img-thumbs/960w/business-man_SZCQC1QEW1.jpg",
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
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fakePeopleList.length,
                    itemBuilder: (context, index) {
                      String name = fakePeopleList[index]['name']!;
                      String imageUrl = fakePeopleList[index]['imageUrl']!;
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            Text(name),
                          ],
                        ),
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
