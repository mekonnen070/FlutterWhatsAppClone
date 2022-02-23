import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return RatingDialog(
        starSize: 35,
        showCloseButton: true,
        enableComment: true,
        initialRating: 1.0,
        // your app's name?
        title: Text(
          'Rating WhatsApp',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        message: Text(
          'Tap or darg a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
        // your app's logo?
        image: Image.asset(
          'assets/whatsapp-logo.png',
          height: 100,
        ),
        submitButtonText: 'Submit',
        commentHint: 'Comments here ...',
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          print('rating: ${response.rating}, comment: ${response.comment}');
        },
      );
    },
  );
}
