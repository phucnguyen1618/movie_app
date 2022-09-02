import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogOneButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final String content;
  final String? textButton;

  const DialogOneButton({
    Key? key,
    required this.onPressed,
    this.title,
    required this.content,
    this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? 'info',
     //   style: AppTextStyle.heavy(),
      ),
      content: Text(
        content,
     //   style: AppTextStyle.regular(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 50),
            padding: EdgeInsets.zero,
       //     backgroundColor: AppColor.primaryColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            textButton == null ? 'OK' : textButton!,
            // style: AppTextStyle.heavy(
            //   color: AppColor.secondTextColor,
            // ),
          ),
        ),
      ],
    );
  }
}
