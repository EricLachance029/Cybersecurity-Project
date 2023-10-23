import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Import your Firebase options from the configuration file.

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter bindings are initialized.

  // Initialize Firebase using the DefaultFirebaseOptions object.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[600],
        hintColor: Colors.cyan[600],
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final logger = Logger();
  String name = ""; // Initialize with an empty string
  String description = ""; // Initialize with an empty string
  double price = 0.0; // Initialize with a default value

  getName(name) {
    this.name = name;
    logger.d(this.name);
  }

  getDescription(description) {
    this.description = description;
    logger.d(this.description);
  }

  getPrice(price) {
    this.price = double.parse(price);
    logger.d(this.price);
  }

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Exercise Equipment").doc(name);

    Map<String, dynamic> exerciseEquipment = {
      "name": name,
      "description": description,
      "price": price
    };

    documentReference.set(exerciseEquipment).whenComplete(() {
      logger.d("$name created");// Vulnerable To unauthorized creation
    });
  }

  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Exercise Equipment").doc(name);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        final data = datasnapshot.data() as Map<String, dynamic>;
        logger.d(data["name"]);
        logger.d(data["description"]);
        logger.d(data["price"]);
      } else {
        logger.d("Document does not exist");
      }
    });
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Exercise Equipment").doc(name);

    Map<String, dynamic> exerciseEquipment = {
      "name": name,
      "description": description,
      "price": price
    };

    documentReference.set(exerciseEquipment).whenComplete(() {
      logger.d("$name updated");// Vulnerable To unauthorized creation
    });
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Exercise Equipment").doc(name);
    documentReference.delete().whenComplete(() {
      logger.d("$name deleted");// Vulnerable To unauthorized creation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase CRUD!'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                  onChanged: (String name) {
                    getName(name);
                  },
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Description"),
                  onChanged: (String description) {
                    getDescription(description);
                  },
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Price"),
                  onChanged: (String price) {
                    getPrice(price);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            createData();// Vulnerable To unauthorized creation
                          },
                          child: const Text("Create"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            readData();
                          },
                          child: const Text("Read"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          onPressed: () {
                            updateData();// Vulnerable To unauthorized update
                          },
                          child: const Text("Update"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            deleteData();// Vulnerable To unauthorized deletion
                          },
                          child: const Text("Delete"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
