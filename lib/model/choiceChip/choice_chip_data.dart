import 'package:flutter/material.dart';

import 'choice_chip_model.dart';

class ChoiceChips {
  static final List<ChoiceChipData> all = [
    ChoiceChipData(
      label: 'All',
      isSelected: false,
      textColor: Colors.white,
      selectedColor: const Color(0xFF126E64),
    ),
    ChoiceChipData(
      label: 'Backend Engineer',
      isSelected: false,
      textColor: Colors.white,
      selectedColor: const Color(0xFF126E64),
    ),
    ChoiceChipData(
      label: 'Frontend Engineer',
      isSelected: false,
      textColor: Colors.white,
      selectedColor: const Color(0xFF126E64),
    ),
    ChoiceChipData(
      label: 'Mobile Developer',
      isSelected: false,
      textColor: Colors.white,
      selectedColor: const Color(0xFF126E64),
    ),
    ChoiceChipData(
      label: 'UI/UX Designer',
      isSelected: false,
      textColor: Colors.white,
      selectedColor: const Color(0xFF126E64),
    ),
  ];
}