import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogTwoButton extends StatelessWidget {
  const DialogTwoButton({
    Key? key,
    required this.onPressedCancel,
    required this.onPressedAgree,
    required this.title,
    required this.content,
    this.cancelTextButton,
    this.agreeTextButton,
  }) : super(key: key);

  final VoidCallback onPressedCancel;
  final VoidCallback onPressedAgree;
  final String title;
  final String content;
  final String? cancelTextButton;
  final String? agreeTextButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressedAgree,
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 50),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            agreeTextButton == null ? 'Đồng ý' : agreeTextButton!,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressedCancel,
          child: Text(
            cancelTextButton == null ? 'Huỷ' : cancelTextButton!,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
