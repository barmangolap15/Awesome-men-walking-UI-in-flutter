import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<JournalEntry> journalEntries = const [
    JournalEntry(date: "2025-09-01", time: "10:42 AM", title: "Morning Walk", details: "2km in 30mins"),
    JournalEntry(date: "2025-08-31", time: "7:15 PM", title: "Evening Run", details: "5km in 28mins"),
    JournalEntry(date: "2025-08-30", time: "6:30 AM", title: "Yoga Session", details: "45mins flexibility"),
    JournalEntry(date: "2025-08-29", time: "5:20 PM", title: "Gym Workout", details: "Chest & Triceps"),
  ];

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
                  "JOURNEY",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                ),
                IconButton(icon: Icon(Icons.menu),color: Colors.blue.shade900, onPressed: () {}),
              ],
            ),
          ),

          // Month selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back_ios, size: 16),
                Column(
                  children: [
                    Text("13, July 2025", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),

          Container(
            height: 550,
          ),
          // Journal entries list
          Expanded(
            child: ListView.builder(
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                final entry = journalEntries[index];
                return _JournalEntryItem(entry: entry);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _JournalEntryItem extends StatelessWidget {
  final JournalEntry entry;
  const _JournalEntryItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(entry.time, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
            const SizedBox(height: 4),
            Text(entry.title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900)),
            Text(entry.details, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600)),
          ]),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

class JournalEntry {
  final String date;
  final String time;
  final String title;
  final String details;

  const JournalEntry({required this.date, required this.time, required this.title, required this.details});
}
