// import 'package:flutter/material.dart';

// class HomePageUI extends StatelessWidget {
//   const HomePageUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Welcome, User",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 30),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Left side text
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Consult your Health with us!",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       "Try free consultation with our Healthmate.ai!",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               // Right side image
//               SizedBox(
//                 width: 140,
//                 height: 150,
//                 child: Image.asset(
//                   "lib/assets/images/greet-doctor.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),

//           // Feature cards
//           GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             children: [
//               _buildFeatureCard(Icons.add, "Consultation"),
//               _buildFeatureCard(Icons.location_on, "Near Hospitals"),
//               _buildFeatureCard(Icons.health_and_safety, "Mental Health"),
//               _buildFeatureCard(Icons.calculate, "BMI Calculator"),
//             ],
//           ),

//           const SizedBox(height: 24),
//           const Text(
//             "Healthcare",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             "10 Tips for a Healthy Lifestyle\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//             style: TextStyle(color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureCard(IconData icon, String label) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 40, color: Colors.blue),
//             const SizedBox(height: 8),
//             Text(label, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class HomePageUI extends StatelessWidget {
//   const HomePageUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Welcome, User",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 30),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Left side text
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Consult your Health with us!",
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       "Try free consultation with our Healthmate.ai!",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 12),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/chat');
//                       },
//                       icon: const Icon(Icons.chat),
//                       label: const Text("Start Chat with Healthmate.ai"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               // Right side image
//               SizedBox(
//                 width: 140,
//                 height: 150,
//                 child: Image.asset(
//                   "lib/assets/images/greet-doctor.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),

//           // Feature cards
//           GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             children: [
//               _buildFeatureCard(Icons.add, "Consultation"),
//               _buildFeatureCard(Icons.location_on, "Near Hospitals"),
//               _buildFeatureCard(Icons.health_and_safety, "Mental Health"),
//               _buildFeatureCard(Icons.calculate, "BMI Calculator"),
//             ],
//           ),

//           const SizedBox(height: 24),
//           const Text(
//             "Healthcare",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             "10 Tips for a Healthy Lifestyle\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//             style: TextStyle(color: Colors.black87),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureCard(IconData icon, String label) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 40, color: Colors.blue),
//             const SizedBox(height: 8),
//             Text(label, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomePageUI extends StatelessWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome, User",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Consult your Health with us!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Try free consultation with our Healthmate.ai!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chat');
                      },
                      icon: const Icon(Icons.chat),
                      label: const Text("Start Chat with Healthmate.ai"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right side image
              SizedBox(
                width: 140,
                height: 150,
                child: Image.asset(
                  "lib/assets/images/greet-doctor.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // List Button
          _buildLongButton(
            context,
            icon: Icons.monitor_heart,
            label: "BMI Prediction",
            color: Colors.green,
            route: '/bmi',
          ),
          const SizedBox(height: 16),
          _buildLongButton(
            context,
            icon: Icons.event_available,
            label: "Doctor List",
            color: Colors.orange,
            route: '/doctorlist',
          ),
          const SizedBox(height: 16),
          _buildLongButton(
            context,
            icon: Icons.calendar_month,
            label: "Make Appointment",
            color: Colors.purple,
            route: '/appointment',
          ),

          const SizedBox(height: 32),
          const Text(
            "Today's Health Tips",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "From admin",
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildLongButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required String route}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
