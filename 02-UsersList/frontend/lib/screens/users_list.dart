import 'package:flutter/material.dart';
import 'package:users/components/user_row.dart';
import 'package:users/data/users_storage.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  // To implement infinite scrolling
  final _scrollController = ScrollController();
  List<Map> _users = [];

  // Function to get the users without making the initState() asyncrounous
  void _setupUsers() async {
    // Get the users before calling the setState method to avoid makint it async
    List<Map> users = await UsersStorage().getAllUsers();

    setState(() {
      _users.addAll(users);
      // _toggleLoadingState();
    });
  }

  // Similar to useState in React Native
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _setupUsers();
      }
    });

    super.initState();
    _setupUsers();
  }

  // Function to generate the UserRow widgets
  List<Widget> _generateUsersRows(users) {
    List<Widget> rows = List.empty(growable: true);

    for (var i = 0; i < users.length; i++) {
      Map currentUser = users[i];

      rows.add(UserRow(
          userImage: currentUser["image"],
          userFullname: currentUser["fullname"],
          userCareer: currentUser["career"],
          userAverage: double.parse(currentUser["average"])));
    }

    return rows;
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Users list")),
        // --- ---
        // Option 1: Future builder
        /* body: FutureBuilder<List<Map>>(
          future: UsersStorage().getAllUsers(),
          builder: (context, snapshot) {
            List<Widget> rows = [];

            if (snapshot.data!.isNotEmpty) {
              for (var i = 0; i < snapshot.data!.length; i++) {
                Map currentUser = snapshot.data![i];

                rows.add(UserRow(
                    userImage: currentUser["image"],
                    userFullname: currentUser["fullname"],
                    userCareer: currentUser["career"],
                    userAverage: double.parse(currentUser["average"])));
              }
            }

            return ListView(
              children: rows,
            );
          },
        ) */

        // --- ---
        // Option 2: Storing the users in the state
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            controller: _scrollController,
            children: [
              ..._generateUsersRows(_users),
              const Center(child: CircularProgressIndicator())
            ],
          ),
        )
        /*  ListView(
          children: _users.isEmpty
              ? const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ]
              : _generateUsersRows(_users), */
        );
  }
}
