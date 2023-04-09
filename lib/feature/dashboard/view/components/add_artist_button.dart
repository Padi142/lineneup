import 'package:flutter/material.dart';
import 'package:lineneup/library/app.dart';

class AddArtistButton extends StatelessWidget {
  final Function() onPressed;
  const AddArtistButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: App.appTheme.colorInactive,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: App.appTheme.colorPrimary,
      ),
    );
  }
}
