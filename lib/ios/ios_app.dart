import 'package:ache_facil/screen/home_page_view.dart';
import 'package:flutter/cupertino.dart';

class IosAPP extends StatelessWidget {
  const IosAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
    );
  }
}
