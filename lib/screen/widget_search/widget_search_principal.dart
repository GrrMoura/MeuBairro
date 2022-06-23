// // ignore_for_file: prefer_const_constructors

// import 'package:ache_facil/android/android_style.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class SearchTextField extends StatefulWidget {
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;

//   const SearchTextField(
//       {Key? key,
//       required this.text,
//       required this.onChanged,
//       required this.hintText})
//       : super(key: key);

//   @override
//   _SearchTextFieldState createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 6.h,
//       width: 91.w,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(2.h), color: Colors.white),
//       margin: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 2.h),
//       child: TextField(
//         style: Theme.of(context)
//             .textTheme
//             .headline4!
//             .copyWith(color: Colors.black),
//         cursorColor: Theme.of(context).colorScheme.secondary,
//         cursorHeight: 3.6.h,
//         textAlign: TextAlign.start,
//         controller: controller,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search,
//               size: 3.5.h,
//               color: Theme.of(context).colorScheme.secondary.withOpacity(0.4)),
//           hintText: widget.hintText,
//           labelStyle:
//               Theme.of(context).textTheme.headline5!.copyWith(color: black),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(2.h),
//           ),
//         ),
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
