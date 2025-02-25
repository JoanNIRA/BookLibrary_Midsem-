import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Function(int) onRatingChanged;

  RatingStars({required this.rating, required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => onRatingChanged(index + 1),
        );
      }),
    );
  }
}