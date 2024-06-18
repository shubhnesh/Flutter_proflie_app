import 'package:flutter/material.dart';
import 'user.dart';
import 'user_details.dart';

void main() {
  runApp(ProfileScreenApp());
}

class ProfileScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<User> users = [
    User(
      name: "Jane Smith",
      email: "jane.smith@gamil.com",
      profilePictureAsset: "assets/images/jane.jpeg",
    ),
    User(
      name: "Lionel Messi",
      email: "lionel.messi@gamil.com",
      profilePictureAsset: "assets/images/messi.jpeg",
    ),
    User(
      name: "Sunil Chhetri",
      email: "sunil.chhetri.football@gamil.com",
      profilePictureAsset: "assets/images/sunil.jpeg",
    ),
    User(
      name: "Sara Tendulkar",
      email: "sara.tendulkar@gamil.com",
      profilePictureAsset: "assets/images/sara.jpeg",
    ),
    User(
      name: "Hrithik Roshan",
      email: "handsome1@gmail.com.com",
      profilePictureAsset: "assets/images/hritik.jpg",
    ),
    User(
      name: "Narendra Modi",
      email: "narendra.modi@gmail.com",
      profilePictureAsset: "assets/images/modi.jpeg",
    ),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columnSpacing: 20,
          columns: [
            DataColumn(
              label: Text(
                'S.No',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'User Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: List.generate(
            users.length,
                (index) => DataRow(
              cells: [
                DataCell(
                  Text(
                    (index + 1).toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                DataCell(
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailsScreen(user: users[index]),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(users[index].profilePictureAsset),
                        ),
                        SizedBox(width: 10),
                        Text(
                          users[index].name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
