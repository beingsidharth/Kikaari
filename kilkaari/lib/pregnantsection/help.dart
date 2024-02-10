import 'package:flutter/material.dart';
import 'package:kilkaari/pregnantsection/test.dart';

class Help extends StatefulWidget {
  const Help({Key? key, required this.title}) : super(key: key);

  final String title;

 
  @override
  State<Help> createState() => _HelpState();
  
}

class _HelpState extends State<Help> {
  final TestSMS _testSMS = TestSMS();
  late TextEditingController _messageController; // Controller for the message input field

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController(); // Initialize the controller
  }

  @override
  void dispose() {
    _messageController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(11, 120, 151, 1)),
        useMaterial3: true,
      );
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: const Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.RmqTYZosCHcDpaou7rqNlQHaGh&pid=Api&P=0&h=180'), // Use Image.network for loading image from URL
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // List of numbers to send messages to
                List<String> numbers = ["6264777794", "8839732959"];

                // Send message to each number with the user-entered message
                String message = _messageController.text.isNotEmpty ? _messageController.text : "Default message";
                numbers.forEach((number) {
                  _testSMS.sendMessageWithLocation(number, message);
                });
              },
              child: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
