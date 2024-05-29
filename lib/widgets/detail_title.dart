import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailTitle extends StatelessWidget {
  final int id;
  final String name;
  final String url;
  const DetailTitle({Key? key, required this.id, required this.name, required this.url})
      : super(key: key);
@override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      label: 
      GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(url));
        },
        child: Text(
              "${name[0].toUpperCase()}${name.substring(1)}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
      ),
      avatar: CircleAvatar(
        child: Text(
          id.toString(),
        ),
      ),
    );
  }
}