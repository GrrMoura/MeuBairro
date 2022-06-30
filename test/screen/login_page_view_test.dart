import 'package:ache_facil/screen/login_page_view.dart';
import 'package:ache_facil/screen/widget_login/widget_sign_in_google_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets("Deve conter um form para email", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    //   final email = find.byWidgetPredicate((widget) {
    //     if (widget is EmailTextField) {
    //       return widget.emailCrtl.runtimeType == TextEditingController &&
    //           widget.model.runtimeType == LoginViewModel &&
    //           widget.title == "email";
    //     }
    //     return false;
    //   });
    //   expect(email, findsOneWidget);
  });

  testWidgets("Deve conter um form para senha", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    expect(find.widgetWithText(Form, "Entre com sua senha"), findsOneWidget);
    expect(find.widgetWithIcon(Form, Icons.lock), findsOneWidget);
  });

  testWidgets("Deve conter um check box", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.text("Lembre-me"), findsOneWidget);
  });

  testWidgets("Deve conter OAth Google", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    expect(find.byType(SigniInGoogleFacebook), findsOneWidget);
    expect(find.widgetWithText(InkWell, "Google"), findsOneWidget);
    expect(
        find.widgetWithIcon(InkWell, FontAwesomeIcons.google), findsOneWidget);
  });

  testWidgets("Deve conter OAth FaceBook", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    expect(find.byType(SigniInGoogleFacebook), findsOneWidget);
    expect(find.widgetWithText(InkWell, "Facebook"), findsOneWidget);
    expect(find.widgetWithIcon(InkWell, FontAwesomeIcons.facebook),
        findsOneWidget);
  });

  testWidgets("Deve conter Botão Cadastar-se", (tester) async {
    await tester.pumpWidget(Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LoginPage(),
      );
    }));

    expect(find.textContaining("Cadastre-se"), findsOneWidget);
  });
}
