import 'package:flutter/material.dart';
import 'form_field.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _ageController = TextEditingController();
  bool _exercisedToday = false;
  String _selectedEmotion = "Joy";
  double _emotionIntensity = 5;
  String _selectedWeather = "Sunny";
  String? _summary;

  final List<String> emotions = [
    "Joy", "Sadness", "Disgust", "Fear", "Anger", "Anxiety", "Embarrassment", "Envy"
  ];

  final List<String> weatherOptions = [
    "Sunny", "Rainy", "Stormy", "Hailing", "Snowy", "Cloudy", "Foggy", "Partly Cloudy"
  ];

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _summary = """
Name: ${_nameController.text}
${_nicknameController.text.isNotEmpty ? "Nickname: ${_nicknameController.text}" : ""}
Age: ${_ageController.text}
Exercised today: ${_exercisedToday ? "Yes" : "No"}
Emotion: $_selectedEmotion ${_emotionIntensity.toInt()}/10
Weather: $_selectedWeather
""";
      });
    }
  }

  void _resetForm() {
    setState(() {
      _nameController.clear();
      _nicknameController.clear();
      _ageController.clear();
      _exercisedToday = false;
      _selectedEmotion = "Joy";
      _emotionIntensity = 5;
      _selectedWeather = "Sunny";
      _summary = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mood Tracker",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: const Color.fromARGB(255, 78, 19, 46),
          ),
        ),
        centerTitle: true,
        elevation: 8,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 153, 83, 124), const Color.fromARGB(255, 230, 91, 186)], // Gradient effect
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              NameField(controller: _nameController),
              NicknameField(controller: _nicknameController),
              AgeField(controller: _ageController),
              ExerciseSwitch(
                exercisedToday: _exercisedToday,
                onChanged: (value) => setState(() {
                  _exercisedToday = value;
                }),
              ),
              SizedBox(height: 16), // Add spacing
              Text("What do you feel today?", style: Theme.of(context).textTheme.bodyLarge),
              EmotionSelector(
                selectedEmotion: _selectedEmotion,
                emotions: emotions,
                onChanged: (value) => setState(() {
                  _selectedEmotion = value!;
                }),
              ),
              SizedBox(height: 16), // Add spacing
              Text("How strong do you feel this emotion?", style: Theme.of(context).textTheme.bodyLarge),
              EmotionIntensitySlider(
                value: _emotionIntensity,
                onChanged: (value) => setState(() {
                  _emotionIntensity = value;
                }),
              ),
              SizedBox(height: 16), // Add spacing
              Text("What's the Weather Today?", style: Theme.of(context).textTheme.bodyLarge),
              WeatherDropdown(
                selectedWeather: _selectedWeather,
                weatherOptions: weatherOptions,
                onChanged: (value) => setState(() {
                  _selectedWeather = value!;
                }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _resetForm, child: Text("Reset")),
                  ElevatedButton(onPressed: _saveForm, child: Text("Save")),
                ],
              ),
              if (_summary != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(_summary!, style: Theme.of(context).textTheme.bodyLarge),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
