// import 'package:ache_facil/android/android_style.dart';
// import 'package:ache_facil/data/sflite.dart';
// import 'package:ache_facil/models/user_model.dart';
// import 'package:ache_facil/util/events.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sizer/sizer.dart';
// import 'package:table_calendar/table_calendar.dart';

// class FavoritePage extends StatefulWidget {
//   FavoritePage({Key? key}) : super(key: key);

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   final UserModel model = UserModel();

//   final db = DatabaseConnect();

//   CalendarFormat _calendarFormat = CalendarFormat.month;

//   DateTime _focusedDay = DateTime.now();

//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 2.h, right: 4.h),
//               child: Text("Meus Favoritos",
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle2!
//                       .copyWith(color: black)),
//             ),
//             IconButton(
//                 onPressed: null,
//                 icon: Icon(FontAwesomeIcons.heartPulse,
//                     color: background, size: 4.h)),
//           ],
//         ),
//         TableCalendar(
//           firstDay: kFirstDay,
//           lastDay: kLastDay,
//           focusedDay: _focusedDay,
//           calendarFormat: _calendarFormat,
//           selectedDayPredicate: (day) {
//             // Use `selectedDayPredicate` to determine which day is currently selected.
//             // If this returns true, then `day` will be marked as selected.

//             // Using `isSameDay` is recommended to disregard
//             // the time-part of compared DateTime objects.
//             return isSameDay(_selectedDay, day);
//           },
//           onDaySelected: (selectedDay, focusedDay) {
//             if (!isSameDay(_selectedDay, selectedDay)) {
//               // Call `setState()` when updating the selected day
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             }
//           },
//           onFormatChanged: (format) {
//             if (_calendarFormat != format) {
//               // Call `setState()` when updating calendar format
//               setState(() {
//                 _calendarFormat = format;
//               });
//             }
//           },
//           onPageChanged: (focusedDay) {
//             // No need to call `setState()` here
//             _focusedDay = focusedDay;
//           },
//         ),
//       ],
//     );
//   }
// }
