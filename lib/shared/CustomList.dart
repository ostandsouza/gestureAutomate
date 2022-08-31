import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String name;
  final String phone;
  final String imageurl;

  CustomTile(this.name, this.phone, this.imageurl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(imageurl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: TextStyle(fontWeight: FontWeight.bold),
              key: ValueKey(name + '_Key')),
          SizedBox(height: 4),
          Text(phone)
        ],
      ),
    );
  }
}
