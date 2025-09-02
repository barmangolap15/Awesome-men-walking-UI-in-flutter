import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitnessDashboard extends StatelessWidget {
  const FitnessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DAILY GOAL",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                ),
                IconButton(icon: Icon(Icons.menu),color: Colors.blue.shade900, onPressed: () {}),
              ],
            ),
          ),

          // Stats over model
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "87",
                        style: GoogleFonts.abel(
                          fontSize: 96,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const Text("%", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _StatItem(icon: Icons.local_fire_department, value: "1,840", label: "calories"),
                      SizedBox(height: 20),
                      _StatItem(icon: Icons.directions_walk, value: "3,248", label: "steps"),
                      SizedBox(height: 20),
                      _StatItem(icon: Icons.timer, value: "6.5", label: "hours"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom card
          Container(
            height: 100,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 2)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.favorite, color: Colors.blue.shade800),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("A simple way to stay healthy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        Text("Dr Golap"),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.location_on, color: Colors.redAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepOrange, size: 28),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue.shade900)),
            Text(label, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
