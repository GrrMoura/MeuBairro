import 'package:ache_facil/screen/widget_search/widget_serch.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(3.2.h, 1.h, 3.h, 2.h),
          child: Text(
            "Precisa de profissional ou comércio?",
            style: Theme.of(context).textTheme.headline6!,
          ),
        ),
        SearchPrincipal()
      ],
    );
  }
}
