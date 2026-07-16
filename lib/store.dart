// import 'package:flutter/material.dart';

// enum Member {
//   alex(name: "Alex", imagePath: 'assets/avatars/Alex.png'),
//   daniel(name: "Daniel", imagePath: 'assets/avatars/Daniel.png'),
//   ethan(name: "Ethan", imagePath: 'assets/avatars/Ethan.png'),
//   jacob(name: "Jacob", imagePath: 'assets/avatars/Jacob.png'),
//   noah(name: "Noah", imagePath: 'assets/avatars/Noah.png'),
//   mia(name: "Mia", imagePath: 'assets/avatars/Mia.png');

//   const Member({required this.name, required this.imagePath});

//   final String name;
//   final String imagePath;
// }


// //
// //  Create your stateless widget MemberCard here
// //
// //
 

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           title: Text(
//             "EX-2 - Stateless Widgets",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Center(
//           // REMOVE THIS CODE AND REPLACE WITH YOUR OWN CODE
//           // We give here an example of CircleAvatar usage (with an image path)
//           child: CircleAvatar(
//             radius: 25,
//             backgroundImage: AssetImage(Member.alex.imagePath),
//           ),
//         ),
//       ),
//     ),
//   );
// }


import 'package:flutter/material.dart';

import '../theme/theme.dart';
impom

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/w8/aang.png'), 
            ),
            const SizedBox(height: 20),
            Text(
              'Mr.Robot',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const Text(
              'SOC Analyst',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const ProfileTile(
              icon: Icons.phone,
              title: "Phone Number",
              data: "+123 456 7890",
            ),
             const ProfileTile(
              icon: Icons.location_on,
              title: "Address",
              data: "Cambodia",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
