import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class DemoFinessDashborad extends StatefulWidget {
  const DemoFinessDashborad({super.key});

  @override
  State<DemoFinessDashborad> createState() => _DemoFinessDashboradState();
}

class _DemoFinessDashboradState extends State<DemoFinessDashborad> {
  final controller = O3DController();

  // Camera values (initial guess)
  double orbitTheta = 0;
  double orbitPhi = 90;
  double orbitRadius = 0.2;

  double targetX = 0;
  double targetY = 1.6;
  double targetZ = 0;

  void _updateCamera() {
    controller.cameraOrbit(orbitTheta, orbitPhi, orbitRadius);
    controller.cameraTarget(targetX, targetY, targetZ);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F7),
      body: SafeArea(
        child: Column(
          children: [


            // Progress Section with 3D model
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [

                  // 3D walking model
                  Positioned.fill(
                    left: 130,
                    child: O3D.asset(
                      src: 'assets/casual_man_character.glb',
                      controller: controller,
                      autoPlay: true,
                      autoRotate: false,
                      cameraControls: false,
                      cameraOrbit: CameraOrbit(orbitTheta, orbitPhi, orbitRadius),
                      cameraTarget: CameraTarget(targetX, targetY, targetZ),
                    ),
                  ),
                ],
              ),
            ),


            // Debug Sliders (to adjust camera live)
            // Debug Sliders (to adjust camera live)
            ExpansionTile(
              title: const Text("Adjust Camera"),
              children: [
                const Text("Camera Orbit"),
                Row(
                  children: [
                    const Text("Theta"),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 360,
                        value: orbitTheta,
                        onChanged: (v) {
                          setState(() => orbitTheta = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(orbitTheta.toStringAsFixed(1)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Phi"),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 180,
                        value: orbitPhi,
                        onChanged: (v) {
                          setState(() => orbitPhi = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(orbitPhi.toStringAsFixed(1)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Radius"),
                    Expanded(
                      child: Slider(
                        min: 0.1,
                        max: 5,
                        value: orbitRadius,
                        onChanged: (v) {
                          setState(() => orbitRadius = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(orbitRadius.toStringAsFixed(2)),
                  ],
                ),

                const Text("Camera Target"),
                Row(
                  children: [
                    const Text("X"),
                    Expanded(
                      child: Slider(
                        min: -5,
                        max: 5,
                        value: targetX,
                        onChanged: (v) {
                          setState(() => targetX = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(targetX.toStringAsFixed(2)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Y"),
                    Expanded(
                      child: Slider(
                        min: -5,
                        max: 5,
                        value: targetY,
                        onChanged: (v) {
                          setState(() => targetY = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(targetY.toStringAsFixed(2)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Z"),
                    Expanded(
                      child: Slider(
                        min: -5,
                        max: 5,
                        value: targetZ,
                        onChanged: (v) {
                          setState(() => targetZ = v);
                          _updateCamera();
                        },
                      ),
                    ),
                    Text(targetZ.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),

          ],
        ),
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
    return Column(
      children: [
        Icon(icon, color: Colors.deepOrange),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
