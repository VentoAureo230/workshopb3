import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/components/user_slide.dart';
import 'package:workshopb3/theme/colors.dart';
import 'package:workshopb3/components/btn/like_btn.dart';
import 'package:workshopb3/components/btn/rewind_btn.dart';
import 'package:workshopb3/components/btn/skip_btn.dart';
import 'package:workshopb3/components/btn/super_like_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<UserProfileCard> userProfiles = [
    const UserProfileCard(
      image: 'images/man.png',
      fullName: 'John Doe',
      age: '30',
      biography: 'A software developer who loves coding.',
      experiences: '5 years of experience in mobile app development.',
      diplomas:
          'Bachelor\'s in Computer Science, Master\'s in Software Engineering', 
    ),
    const UserProfileCard(
      image: 'images/woman.png',
      fullName: 'Jane Smith',
      age: '28',
      biography: 'Passionate about design and user experience.',
      experiences: 'UX/UI Designer with a focus on mobile apps.',
      diplomas: 'Bachelor\'s in Graphic Design',
    ),
    // Add more user profiles here...
  ];
  int currentProfileIndex = 0;

  void handleLike() {
    setState(() {
      currentProfileIndex++;
    });
  }

  void handleSkip() {
    setState(() {
      currentProfileIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color startColor = BlueColor;
    const Color endColor = AquaColor;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GreyColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Stack(
                      children: userProfiles.asMap().entries.map((entry) {
                        final index = entry.key;
                        final userProfile = entry.value;
                  
                        final topPosition = index * 20.0;
                        final rotation = index == currentProfileIndex
                            ? 0.0
                            : index < currentProfileIndex
                                ? -0.1
                                : 0.1;
                  
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: topPosition,
                          right: 0,
                          left: 0,
                          child: Transform.rotate(
                            angle: rotation,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                  
                                if (details.delta.dx > 0) {
                                  handleLike();
                                } else {
                                  handleSkip();
                                }
                              },
                              child: userProfile,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: RewindBtn(
                          onTap: () {
                            handleSkip();
                          },
                        ),
                      ),
                      SkipBtn(
                        onTap: () {
                          handleSkip();
                        },
                      ),
                      LikeBtn(
                        onTap: () {
                          handleLike();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SuperLikeBtn(
                          onTap: () {
                            handleLike();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
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
      ),
    );
  }
}
