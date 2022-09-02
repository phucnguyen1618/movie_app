import 'package:flutter/material.dart';

class DialogNetwork extends StatelessWidget {
  const DialogNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Không có kết nối',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0,),
        Text(
          'Kết nối mạng của bạn đã có vấn đề.',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
