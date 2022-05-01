import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnRememberMe extends StatelessWidget {
  bool? remember = true;
  BtnRememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: remember,
          onChanged: (newValue) {},
          checkColor: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).backgroundColor,
        ),
        Text(
          'Lembre-me',
          style: GoogleFonts.inter(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
