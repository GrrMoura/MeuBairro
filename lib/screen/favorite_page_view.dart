// ignore_for_file: avoid_print

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/user_model.dart';
import 'package:ache_facil/util/events.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final UserModel model = UserModel();

  final db = DatabaseConnect();

  late final ValueNotifier<List<Event>> _selectedEvents;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  // DateTime? _rangeStart;

  // DateTime? _rangeEnd;
  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      // _rangeStart = start;
      // _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0.h, vertical: 2.h),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("EVENTOS"),
          TableCalendar<Event>(
            locale: "pt_BR",
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              holidayTextStyle: Theme.of(context).textTheme.headline5!,
              selectedTextStyle: Theme.of(context).textTheme.headline5!,
              weekendTextStyle: Theme.of(context).textTheme.headline5!,
              defaultTextStyle: Theme.of(context).textTheme.headline5!,
              markerDecoration: const BoxDecoration(
                  color: background, shape: BoxShape.circle),
              markerSize: 7,
              markerMargin: const EdgeInsets.symmetric(horizontal: 1),

              rangeEndTextStyle: Theme.of(context).textTheme.headline5!,
              rangeStartTextStyle: Theme.of(context).textTheme.headline5!,
              todayTextStyle: Theme.of(context).textTheme.headline5!,
              selectedDecoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),

              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
              ),
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            daysOfWeekHeight: 20,
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
                weekdayStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            headerStyle: HeaderStyle(
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMMM("Pt-br").format(date),
                titleTextStyle: Theme.of(context).textTheme.headline4!,
                formatButtonTextStyle: Theme.of(context).textTheme.headline5!,
                formatButtonDecoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadiusDirectional.circular(10))),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            //TODO: eventos
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: background,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text(
                          '${value[index]}',
                          style: Theme.of(context).textTheme.headline4!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:ache_facil/android/android_style.dart';
// import 'package:ache_facil/data/sflite.dart';
// import 'package:ache_facil/models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sizer/sizer.dart';

// import 'shared_widget/widget_favoritos_itens.dart';

// class FavoritePage extends StatelessWidget {
//   final UserModel model = UserModel();
//   final db = DatabaseConnect();

//   FavoritePage({Key? key}) : super(key: key);

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
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 1.0.h),
//           child: FutureBuilder(
//               future: db.getFavorites(),
//               builder: ((context, AsyncSnapshot snapshot) {
//                 var data = snapshot.data;
//                 var dataLength = 0;
//                 if (snapshot.hasData) {
//                   dataLength = data!.length;
//                 }
//                 return SizedBox(
//                   height: 90.h,
//                   child: ListView.builder(
//                       itemCount: dataLength,
//                       itemBuilder: (context, index) {
//                         return FavoritoItens(data[index]);
//                       }),
//                 );
//               })),
//         )
//       ],
//     );
//   }
// }
