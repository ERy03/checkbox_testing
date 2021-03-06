import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generate a list of available hobbies here
  List<Map> availableHobbies = [
    {"name": "Football", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {
      "name": "Video Games",
      "isChecked": false,
    },
    {"name": "Readding Books", "isChecked": false},
    {"name": "Surfling The Internet", "isChecked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Choose your hobbies:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // The checkboxes will be here
            Column(
                children: availableHobbies.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  title: Text(hobby["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                    });
                  });
            }).toList()),

            // Display the result here
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            Wrap(
              children: availableHobbies.map((hobby) {
                if (hobby["isChecked"] == true && hobby["name"] == "Football") {
                  return TextFormField(
                    initialValue: "Football",
                    decoration: InputDecoration(
                      labelText: 'Your name',
                      enabled: false,
                    ),
                  );
                } else if (hobby["isChecked"] == true) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Your name',
                      hintText: "you dont like football",
                    ),
                  );
                }

                return Container();
              }).toList(),
            )
          ]),
        ),
      ),
    );
  }
}
