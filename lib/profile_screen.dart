import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inverted_circle_cliper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: InvertedCircleClipper(),
        child: Container(
          color: Colors.grey.shade100,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "JOURNEY",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                        ),
                        IconButton(icon: Icon(Icons.menu),color: Colors.blue.shade900, onPressed: () {}),
                      ],
                    ),
                    Text('Golap', style: GoogleFonts.abel(
                      fontSize: 60, fontWeight: FontWeight.bold, color: Colors.blue.shade900
                    ),),
                    Text('29 years old', style: GoogleFonts.poppins(
                      fontSize: 15, color: Colors.grey.shade500, fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),

              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Daily goals",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    _goalTile(
                      color: Colors.orange,
                      icon: Icons.local_fire_department,
                      label: "Calories",
                      value: "2,000",
                    ),
                    const SizedBox(height: 12),
                    _goalTile(
                      color: Colors.deepPurple,
                      icon: Icons.directions_walk,
                      label: "Steps",
                      value: "3,500",
                    ),
                    const SizedBox(height: 12),
                    _goalTile(
                      color: Colors.blue,
                      icon: Icons.nightlight_round,
                      label: "Sleep",
                      value: "8h",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goalTile({
    required Color color,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
