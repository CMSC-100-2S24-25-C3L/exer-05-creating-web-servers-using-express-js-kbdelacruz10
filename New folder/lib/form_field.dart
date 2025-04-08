import 'package:flutter/material.dart';

// Name Field
class NameField extends StatelessWidget {
  final TextEditingController controller;
  const NameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Name"),
      validator: (value) => value!.isEmpty ? "Name is required" : null,
    );
  }
}

// Nickname Field
class NicknameField extends StatelessWidget {
  final TextEditingController controller;
  const NicknameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Nickname (Optional)"),
    );
  }
}

// Age Field
class AgeField extends StatelessWidget {
  final TextEditingController controller;
  const AgeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Age"),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return "Age is required";
        }
        int? age = int.tryParse(value);
        if (age == null || age < 1 || age > 99) {
          return "Enter a valid age (1-99)";
        }
        return null;
      },
    );
  }
}

// Exercise Switch
class ExerciseSwitch extends StatelessWidget {
  final bool exercisedToday;
  final ValueChanged<bool> onChanged;
  const ExerciseSwitch({super.key, required this.exercisedToday, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Exercised today"),
        Switch(value: exercisedToday, onChanged: onChanged),
      ],
    );
  }
}

// Emotion Selector
class EmotionSelector extends StatelessWidget {
  final String selectedEmotion;
  final List<String> emotions;
  final ValueChanged<String?> onChanged;
  const EmotionSelector({super.key, required this.selectedEmotion, required this.emotions, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: emotions.map((emotion) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(value: emotion, groupValue: selectedEmotion, onChanged: onChanged),
            Text(emotion),
          ],
        );
      }).toList(),
    );
  }
}

// Emotion Intensity Slider
class EmotionIntensitySlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  const EmotionIntensitySlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(min: 0, max: 10, divisions: 10, value: value, onChanged: onChanged);
  }
}

// Weather Dropdown
class WeatherDropdown extends StatelessWidget {
  final String selectedWeather;
  final List<String> weatherOptions;
  final ValueChanged<String?> onChanged;
  const WeatherDropdown({super.key, required this.selectedWeather, required this.weatherOptions, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedWeather,
      items: weatherOptions.map((weather) {
        return DropdownMenuItem(value: weather, child: Text(weather));
      }).toList(),
      onChanged: onChanged,
    );
  }
}