import 'package:flutter/material.dart';
import 'package:state_management_app/util/dimension.dart';

class Kbutton extends StatelessWidget {
  final Function onPressed;
  final String labelText;
  final IconData? icon;
  final Color labelColor;
  final Color? kButtonColor;
  final Gradient? gradient;

  const Kbutton({
    Key? key,
    required this.onPressed,
    required this.labelText,
    this.icon,
    required this.labelColor,
    this.kButtonColor,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(MARGIN_MEDIUM),
        ),
        gradient: gradient,
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(MARGIN_MEDIUM_2 *1.4),
        color: kButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(MARGIN_MEDIUM),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: TEXT_REGULAR,
                  ),
                ),
              ),
              Icon(this.icon,color: labelColor,),
            ],
          ),
        ),
      ),
    );
  }
}
