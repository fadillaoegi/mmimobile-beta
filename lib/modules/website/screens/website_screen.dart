import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';

class WebsiteScreen extends StatefulWidget {
  const WebsiteScreen({super.key});

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Website'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              color: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () async {
                await EasyLauncher.url(url: "https://pub.dev");
              },
              child: const Text("Open url"),
            ),
          ),
        ],
      ),
    );
  }
}
