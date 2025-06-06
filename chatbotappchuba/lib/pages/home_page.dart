import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'You');
  final ChatUser _geminiUser = ChatUser(id: '2', firstName: 'Gemini');

  final List<ChatMessage> _messages = [];
  final gemini = Gemini.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEE37FF),
        elevation: 8, 
        shadowColor: Colors.black.withOpacity(0.4), // Shadow color
        title: const Text('Chuba ChatBot', style: TextStyle(color: Colors.black)),
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Color(0xFFBF00EF),
            containerColor: Color(0xFFFFADFF),
          textColor: Colors.white,
        ),
        inputOptions: const InputOptions(
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEE37FF),
            hintText: 'Enter a message...',
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
        ),
        onSend: (ChatMessage m) {
          getGeminiResponse(m);
        },
        messages: _messages,
      ),
    backgroundColor: Color(0xFFF077FB),);
  }

  Future<void> getGeminiResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });

    try {
      final response = await gemini.text(m.text);

      if (response != null && response.output != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _geminiUser,
              createdAt: DateTime.now(),
              text: response.output!,
            ),
          );
        });
      }
    } catch (e) {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _geminiUser,
            createdAt: DateTime.now(),
            text: "Something went wrong: $e",
          ),
        );
      });
    }
  }
}
