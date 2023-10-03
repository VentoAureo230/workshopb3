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
      fullName: 'John Doe',
      age: '30',
      biography: 'A software developer who loves coding.',
      experiences: '5 years of experience in mobile app development.',
      diplomas: 'Bachelor\'s in Computer Science, Master\'s in Software Engineering',
    ),
    const UserProfileCard(
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
                  height: MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
                  child: ListView.builder(
                    itemCount: userProfiles.length,
                    itemBuilder: (context, index) {
                      final userProfile = userProfiles[index];
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        left: index == currentProfileIndex ? 0 : -MediaQuery.of(context).size.width,
                        right: index == currentProfileIndex ? 0 : -MediaQuery.of(context).size.width,
                        child: userProfile,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RewindBtn(
                      onTap: () {
                        handleSkip();
                      },
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
                    SuperLikeBtn(
                      onTap: () {
                        handleLike();
                      },
                    ),
                  ],
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
