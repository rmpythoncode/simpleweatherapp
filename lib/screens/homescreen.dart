import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade800,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _cloudIcon(),
              _temperature(),
              _location(),
              _date(),
              _hourlyPrediction(),
              _weeklyPrediction(),
            ],
          ),
        ),
      ),
    );
  }
}

final weeks = ['4', '5', '6', '4', '5', '6', '4', '5', '6', '4', '5', '6'];

_weeklyPrediction() {
  return Expanded(
    child: Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weeks.length,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              child: Card(
                child: Center(
                  child: Text(
                    '${weeks[index]}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            );
          }),
    ),
  );
}

final times = ['1', '2', '3', '1', '2', '3', '1', '2', '3', '1', '2', '3'];

_hourlyPrediction() {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
    ),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: times.length,
        itemBuilder: (context, index) {
          return Container(
            width: 50,
            child: Card(
              child: Center(
                child: Text('${times[index]}'),
              ),
            ),
          );
        }),
  );
}

_date() {
  return Row(
    children: [
      Text('Segunda Feira'),
      SizedBox(
        width: 10,
      ),
      Text(
        '26/10/75',
      ),
    ],
  );
}

_location() {
  return Row(
    children: [
      Icon(Icons.place),
      SizedBox(
        width: 20,
      ),
      Text("Sao Paulo, BR"),
    ],
  );
}

_temperature() {
  return Text(
    '30',
    style: TextStyle(
      fontSize: 70,
      fontWeight: FontWeight.w100,
    ),
  );
}

_cloudIcon() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Icon(
      Icons.cloud,
      size: 80,
    ),
  );
}
