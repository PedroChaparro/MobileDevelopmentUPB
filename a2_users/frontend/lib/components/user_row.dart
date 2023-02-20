import 'package:flutter/material.dart';
import 'package:a2_users/components/user_text.dart';

class UserRow extends StatelessWidget {
  final String userImage;
  final String userFullname;
  final String userCareer;
  final double userAverage;

  const UserRow(
      {super.key,
      required this.userImage,
      required this.userFullname,
      required this.userCareer,
      required this.userAverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration:
          BoxDecoration(border: Border.all(color: const Color(0XFFcecece))),
      child: Padding(
          // Inner spacing
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            // Image column
            Column(
              children: [
                Image(
                  image: NetworkImage(userImage),
                  width: 80,
                  height: 80,
                )
              ],
            ),
            // Text column
            Expanded(
                child: Padding(
              // To separate the columns horizontally
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  UserText(text: "Name: $userFullname"),
                  UserText(text: "Career: $userCareer"),
                  UserText(text: "Average: $userAverage")
                ],
              ),
            )),
          ])),
    );
  }
}
