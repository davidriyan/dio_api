import 'package:flutter/material.dart';

import 'services.dart';
import 'person.dart';
import 'person_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Person? person;

// ======INI ADALAH CARA MELAKUKAN GET TANPA BUTTON======
/*  
  @override
  void initState() {
    super.initState();
    fetchData(); // Panggil fetchData saat halaman dimuat
  }

  Future<void> fetchData() async {
    try {
      Person? result = await Services.getById(1);
      setState(() {
        if (result != null) {
          person = result;
        }
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dio Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              person != null
                  ? PersonCard(
                      person: person!,
                    )
                  : const Text('no data'),
              const SizedBox(
                height: 20,
              ),
              //melakukan GET data menggunakan ElevatedButton
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await Services.getById(2);
                      setState(() {
                        if (result != null) {
                          person = result;
                        }
                      });
                    },
                    child: const Text('GET')),
              ),
              //melakukan POST data menggunakan ElevatedButton
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {}, child: const Text('POST')),
              )
            ],
          ),
        ));
  }
}
