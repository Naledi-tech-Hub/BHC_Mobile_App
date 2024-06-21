import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailService {
  Future<void> sendEmail(String? subject) async {
    final Email email = Email(
      subject: subject ?? '',
      recipients: ['client@praa.ms'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
