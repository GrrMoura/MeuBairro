import 'package:ache_facil/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnRememberMe extends StatelessWidget {
  final GetxLoginController controller = Get.put(GetxLoginController());

  BtnRememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<GetxLoginController>(
          builder: (controller) => Checkbox(
            value: controller.remember,
            onChanged: (value) {
              controller.rememberMe();
            },
            checkColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).backgroundColor,
          ),
        ),
        Text('Lembre-me',
            style: style.headline5!.copyWith(color: Colors.white)),
      ],
    );
  }
}
