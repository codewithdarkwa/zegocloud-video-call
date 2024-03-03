import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final callIDController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: callIDController,
                  decoration: const InputDecoration(
                    labelText: 'join a video call by id',
                  ),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'username',
                  ),
                ),

                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallPage(
                          id: callIDController.text,
                          userId: nanoid(),
                          username:usernameController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text('join'),
                ),
              ],
            ),
          ),
        ));
  }
}

class CallPage extends StatelessWidget {
  const CallPage({
    super.key,
    required this.id,
    required this.username,
    required this.userId,
  });

  final String id;
  final String userId;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1638232801,
      // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "a9ccfd452c3e48c960255681a4a7c01e6f5aeedadb8330b92c999849da22acfc",
      // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId,
      userName: username,
      callID: id,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
