import 'package:flutter/material.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class HelpAndSupportScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _sendEmail(BuildContext context) async {
    final smtpServer = gmail('peterawod74@gmail.com','rgrymtxibxqnfzll');
    final message = Message()
      ..from = Address(_emailController.text, _nameController.text)
      ..recipients.add('peterawod74@gmail.com')
      ..subject = 'New Message from Contact Form'
      ..text = _messageController.text;

    try {
      await send(message, smtpServer);
      defaultSnackBarMessage(BuildContext: context,message: 'Message sent successfully',duration: 3);
    } catch (e) {
      print(e);
      defaultSnackBarMessage(BuildContext: context,message: 'Failed to send message. Please try again.',duration: 3);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],

      appBar: AppBar(
        backgroundColor: Colors.teal[900],

        title: Text('Help and support'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get in touch with us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white54,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Have a question or feedback? We would love to hear from you.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),

              defaultTextFormField(
                controller: _nameController,
                  label: 'Your Name',
                type: TextInputType.text,
                prefix: Icons.person_2_outlined,

              ),
              SizedBox(height: 16.0),
              defaultTextFormField(
                controller: _emailController,
                label: 'Email Address',
                type: TextInputType.emailAddress,
                prefix: Icons.email_outlined,
              ),
              SizedBox(height: 16.0),
              defaultTextFormField(
                controller: _messageController,
                label: 'Message',
                maxLines: 4,
                prefix: Icons.message_outlined,
                type: TextInputType.text,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => _sendEmail(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[200], //must change
                ),
                child: Text(
                    'Send Message',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: HexColor('#070929'),
                  ),
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
