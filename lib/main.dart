import 'package:flutter/material.dart';
import 'color_circle.dart';
import 'color_value_changer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Mixer',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const ColorMixerPage(),
    );
  }
}

class ColorMixerPage extends StatefulWidget {
  const ColorMixerPage({super.key});

  @override
  _ColorMixerPageState createState() => _ColorMixerPageState();
}

class _ColorMixerPageState extends State<ColorMixerPage> {
  double red = 0;
  double green = 0;
  double blue = 0;

  void updateColor(String channel, double value) {
    setState(() {
      if (channel == 'red') red = value;
      if (channel == 'green') green = value;
      if (channel == 'blue') blue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎨 Color Mixer'),
        backgroundColor: currentColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorCircle(
              color: currentColor,
              size: 160,
            ),
            const SizedBox(height: 40),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    ColorValueChanger(
                      label: "Red",
                      value: red,
                      activeColor: Colors.red,
                      onChanged: (val) => updateColor('red', val),
                    ),
                    const SizedBox(height: 12),
                    ColorValueChanger(
                      label: "Green",
                      value: green,
                      activeColor: Colors.green,
                      onChanged: (val) => updateColor('green', val),
                    ),
                    const SizedBox(height: 12),
                    ColorValueChanger(
                      label: "Blue",
                      value: blue,
                      activeColor: Colors.blue,
                      onChanged: (val) => updateColor('blue', val),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'RGB(${red.toInt()}, ${green.toInt()}, ${blue.toInt()})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}