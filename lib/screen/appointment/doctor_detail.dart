// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../models/doctor.dart';

// class DoctorDetailPage extends StatefulWidget {
//   final Doctor doctor;
//   final VoidCallback? onAppointmentBooked;

//   const DoctorDetailPage({
//     Key? key,
//     required this.doctor,
//     this.onAppointmentBooked,
//   }) : super(key: key);

//   @override
//   State<DoctorDetailPage> createState() => _DoctorDetailPageState();
// }

// class _DoctorDetailPageState extends State<DoctorDetailPage> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   Future<void> _selectDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//     if (picked != null) {
//       setState(() => selectedDate = picked);
//     }
//   }

//   Future<void> _selectTime() async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() => selectedTime = picked);
//     }
//   }

//   Future<void> _bookAppointment() async {
//     if (selectedDate == null || selectedTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select date and time')),
//       );
//       return;
//     }

//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('User not logged in')),
//       );
//       return;
//     }

//     final appointmentDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     final appointmentTime = selectedTime!.format(context);

//     try {
//       await FirebaseFirestore.instance.collection('appointments').add({
//         'doctorName': widget.doctor.name,
//         'based': widget.doctor.based,
//         'contact': widget.doctor.contact,
//         'date': appointmentDate,
//         'time': appointmentTime,
//         'userId': user.uid,
//         'createdAt': DateTime.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Appointment booked successfully')),
//       );

//       widget.onAppointmentBooked?.call();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to book appointment: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dateStr = selectedDate != null
//         ? DateFormat('EEEE, dd MMM yyyy').format(selectedDate!)
//         : 'Select Date';

//     final timeStr =
//         selectedTime != null ? selectedTime!.format(context) : 'Select Time';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.doctor.name),
//         backgroundColor: Colors.pink,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildDetailItem('Age', '${widget.doctor.age} years old'),
//             _buildDetailItem('Based', widget.doctor.based),
//             _buildDetailItem('Contact', widget.doctor.contact),
//             const SizedBox(height: 30),
//             const Text(
//               'Appointment Schedule',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.pink,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _selectDate,
//                   icon: const Icon(Icons.calendar_today),
//                   label: Text(dateStr),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink[100],
//                     foregroundColor: Colors.pink[900],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton.icon(
//                   onPressed: _selectTime,
//                   icon: const Icon(Icons.access_time),
//                   label: Text(timeStr),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink[100],
//                     foregroundColor: Colors.pink[900],
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _bookAppointment,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text(
//                   'Book Appointment',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailItem(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.w500)),
//           Text(value,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/doctor.dart';

class DoctorDetailPage extends StatefulWidget {
  final Doctor doctor;
  final VoidCallback? onAppointmentBooked;

  const DoctorDetailPage({
    Key? key,
    required this.doctor,
    this.onAppointmentBooked,
  }) : super(key: key);

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  Future<void> _bookAppointment() async {
    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in')),
      );
      return;
    }

    final appointmentDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    final appointmentTime = selectedTime!.format(context);

    try {
      await FirebaseFirestore.instance.collection('appointments').add({
        'doctorId': widget.doctor.id,
        'doctorName': widget.doctor.fullname,
        'based': widget.doctor.based,
        'contact': widget.doctor.contact,
        'specialist': widget.doctor.specialist,
        'date': appointmentDate,
        'time': appointmentTime,
        'userId': user.uid,
        'createdAt': DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment booked successfully')),
      );

      widget.onAppointmentBooked?.call();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book appointment: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = selectedDate != null
        ? DateFormat('EEEE, dd MMM yyyy').format(selectedDate!)
        : 'Select Date';
    final timeStr =
        selectedTime != null ? selectedTime!.format(context) : 'Select Time';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor.fullname),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (widget.doctor.profile != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.doctor.profile!),
              )
            else
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            const SizedBox(height: 20),
            Text(
              widget.doctor.fullname,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.doctor.specialist,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildDetailItem('Age', '${widget.doctor.age} years'),
            _buildDetailItem('Based', widget.doctor.based),
            _buildDetailItem('Contact', widget.doctor.contact),
            _buildDetailItem('Appointment Count',
                '${widget.doctor.appointmentCount ?? 0} times'),
            const SizedBox(height: 30),
            const Text(
              'Appointment Schedule',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(dateStr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                      foregroundColor: Colors.pink[900],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _selectTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(timeStr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100],
                      foregroundColor: Colors.pink[900],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _bookAppointment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Book Appointment',
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
