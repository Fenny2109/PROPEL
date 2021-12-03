import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendEmail({
  required String toName,
  required String toEmail,
  required String fromName,
  required String fromEmail,
  required String subject,
  required String msgName,
  required String msgPhone,
  required String msgModel,
  required String msgAddress,
}) async {
  const serviceId = 'service_uh6xqll';
  const templateId = 'template_enzsd56';
  const userId = 'user_a0ipEucmSfyYgysDWKfho';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json'
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'to_name': toName,
        'to_email': toEmail,
        'from_name': fromName,
        'from_email': fromEmail,
        'subject': subject,
        'msgName': msgName,
        'msgPhoneNo': msgPhone,
        'msgCarModelNo': msgModel,
        'msgAddress': msgAddress,
      }
    }),
  );
  print(response.body);
}

class Validator {
  static String? validateName(String value) {
    if(value.isEmpty) {
      return "Name can't be empty!";
    }
    if(value.length < 2){
      return "Please enter a valid name";
    }
    return null;
  }

  static String? validateModel(String value) {
    if(value.isEmpty) {
      return "Model Number can't be empty!";
    }
    if(value.length < 2 || value.length > 15){
      return "Please enter a valid Model Number";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if(value.isEmpty) {
      return "Phone number can't be empty!";
    }
    if(value.length != 10){
      return "Please enter a valid 10-digit phone number";
    }
    return null;
  }
}
