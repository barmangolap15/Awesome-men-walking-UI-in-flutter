import 'package:fire_animation/demo_finess_dashborad.dart';
import 'package:fire_animation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:o3d/o3d.dart';

import 'fitness_dashboard.dart';
import 'history_screen.dart';

class FitnessApp extends StatefulWidget {
  const FitnessApp({super.key});

  @override
  State<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  int _selectedIndex = 0;
  final O3DController _controller = O3DController();

  final List<Widget> _screens = const [
    FitnessDashboard(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  /// Different camera orbits for each tab
  final List<CameraOrbit> _tabOrbits = [
    CameraOrbit(0, 90, 0.2),    // Dashboard
    CameraOrbit(281.5, 90, 0.2),   // History
    CameraOrbit(0, 90, 0.2),  // Profile
  ];

  /// Different camera targets for each tab
  final List<CameraTarget> _tabTargets = [
    CameraTarget(-0.5, 1.6, 0.7),    // Dashboard
    CameraTarget(-1, 1.6, 0.1),   // History
    CameraTarget(0, 2.7, -1),  // Profile
  ];

  void _onTabChange(int index) {
    setState(() => _selectedIndex = index);

    // Smooth orbit transition
    _controller.cameraOrbit(
      _tabOrbits[index].theta,
      _tabOrbits[index].phi,
      _tabOrbits[index].radius,
    );

    _controller.cameraTarget(
      _tabTargets[index].x,
      _tabTargets[index].y,
      _tabTargets[index].z,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Shared 3D model (always alive)
          Positioned.fill(
            child: O3D.asset(
              src: 'assets/casual_man_character.glb',
              controller: _controller,
              autoPlay: true,
              autoRotate: false,
              cameraControls: false,
              cameraOrbit: _tabOrbits[_selectedIndex],
              cameraTarget: _tabTargets[_selectedIndex],
            ),
          ),

          // Overlay screen content
          Positioned.fill(child: _screens[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey.shade200,
              haptic: true,
              tabBorderRadius: 15,
              tabActiveBorder: Border.all(color: Colors.grey.shade500, width: 1),
              tabBorder: Border.all(color: Colors.grey.shade400, width: 1),
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 500),
              gap: 8,
              color: Colors.grey.shade400,
              activeColor: Colors.blue.shade700,
              iconSize: 24,
              tabBackgroundColor: Colors.blue.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              selectedIndex: _selectedIndex,
              onTabChange: _onTabChange,
              tabs: const [
                GButton(icon: LineIcons.heartbeat, text: 'Home',),
                GButton(icon: LineIcons.history, text: 'History',),
                GButton(icon: LineIcons.user, text: 'Profile',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
