import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({
    Key key,
    @required this.desc,
  }) : super(key: key);

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 15),
      child: Text(desc,
          style: TextStyle(fontSize: 12.sp)),
    );
  }
}
