import 'package:ache_facil/screen/home_page_view.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets("Deve conter um botão 'Escolha sua localização'", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        home: HomePage(),
      );
    }));

    expect(find.text("Escolha sua localização"), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Escolha sua localização"),
        findsOneWidget);
  });

  testWidgets("Deve conter uma foto", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: HomePage(),
      );
    }));

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(HeaderHome), findsOneWidget);
  });
}
