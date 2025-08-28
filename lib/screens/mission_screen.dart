import 'package:flutter/material.dart';
import '../widgets/custom_scaffold.dart';
import 'package:app_chauffeur1/screens/detail_mission_screen.dart';

class MissionScreen extends StatefulWidget {
  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  bool isTodaySelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Missions Du jour", isTodaySelected, true),
                const SizedBox(width: 10),
                _buildToggleButton("Missions De demain", isTodaySelected, false),
              ],
            ),

            const SizedBox(height: 20),

            // Missions List
            _buildMissionCard("T49", "07h00 – 08h00", "214 TU 2545", 1),
            _buildMissionCard("D13", "08h45 – 10h00", "214 TU 2545", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, bool selected, bool isFirst) {
    final isActive = (isFirst && selected) || (!isFirst && !selected);
    return GestureDetector(
      onTap: () {
        setState(() {
          isTodaySelected = isFirst;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.lightBlue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMissionCard(String code, String time, String plate, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.lightBlue[100],
                child: Text(
                  "$index",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$code  |  $time",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      plate,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => CustomScaffold(initialIndex: 1)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                          ),
                          child: const Text("Voir Détails",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                          ),
                          child: const Text("Démarrer"),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
