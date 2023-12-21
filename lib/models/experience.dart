import 'package:flutter/material.dart';

class Experience {
  final String number;
  final String companyName;
  final String tenure;
  final String jobTitle;
  final String description;
  final Color color;

  const Experience({
    required this.number,
    required this.companyName,
    required this.tenure,
    required this.jobTitle,
    required this.description,
    required this.color,
  });
}
