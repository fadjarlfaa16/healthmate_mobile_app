// import 'package:flutter/material.dart';
// import '../../models/doctor.dart';

// class DoctorListPage extends StatelessWidget {
//   final Function(Doctor) onDoctorSelected;

//   const DoctorListPage({Key? key, required this.onDoctorSelected})
//       : super(key: key);

//   final List<Doctor> doctors = const [
//     Doctor(
//       name: 'Dr. Sarah Johnson',
//       age: 35,
//       based: 'Central Hospital',
//       contact: '0812-3456-7890',
//     ),
//     Doctor(
//       name: 'Dr. Michael Chen',
//       age: 42,
//       based: 'City Medical Center',
//       contact: '0821-1122-3344',
//     ),
//     Doctor(
//       name: 'Dr. Emily Wilson',
//       age: 38,
//       based: 'Westside Clinic',
//       contact: '0833-4455-6677',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Available Doctors'),
//         backgroundColor: Colors.pink,
//         automaticallyImplyLeading: false,
//       ),
//       body: ListView.builder(
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return Card(
//             margin: const EdgeInsets.all(8),
//             child: ListTile(
//               leading: const Icon(Icons.medical_services, color: Colors.pink),
//               title: Text(doctor.name),
//               subtitle: Text('${doctor.age} years old'),
//               trailing: Text(doctor.based),
//               onTap: () => onDoctorSelected(doctor),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/doctor.dart';
import 'doctor_detail.dart';

class DoctorListPage extends StatelessWidget {
  final Function(Doctor) onDoctorSelected;
  const DoctorListPage({Key? key, required this.onDoctorSelected})
      : super(key: key);

  Future<List<Doctor>> _fetchDoctors() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();
    return snapshot.docs
        .map((doc) => Doctor.fromFirestore(doc.data(), doc.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Available Doctors'), backgroundColor: Colors.pink),
      body: FutureBuilder<List<Doctor>>(
        future: _fetchDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No doctors found.'));
          }

          final doctors = snapshot.data!;
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return ListTile(
                leading: doctor.profile != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(doctor.profile!))
                    : const CircleAvatar(child: Icon(Icons.person)),
                title: Text(doctor.fullname),
                subtitle: Text('${doctor.specialist} • ${doctor.based}'),
                // onTap: () => onDoctorSelected(doctor),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailPage(doctor: doctor),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
