import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'defult_button.dart';


class OPTForm extends StatefulWidget {
  OPTForm({Key key}) : super(key: key);

  @override
  State<OPTForm> createState() => _OPTFormState();
}

class _OPTFormState extends State<OPTForm> {


  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  nextNode({String val, FocusNode focusNode}){
    if(val.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOPTField(
                  onChanged: (val)=> nextNode(val: val, focusNode: pin2FocusNode)
              ),
              buildOPTField(
                  focusNode:pin2FocusNode ,
                  onChanged: (val)=> nextNode(val: val, focusNode: pin3FocusNode)
              ),
              buildOPTField(
                  focusNode: pin3FocusNode,
                  onChanged: (val)=> nextNode(val: val, focusNode: pin4FocusNode)
              ),
              buildOPTField(
                  focusNode: pin4FocusNode,
                  onChanged: (val)=> pin4FocusNode.unfocus()
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          DefaultButton(),
        ],
      ),
    );
  }

  Container buildOPTField({Function onChanged, FocusNode focusNode}) {
    return Container(
        width: 12.w,
        child: TextFormField(
          autofocus: true,
          focusNode: focusNode,
          // maxLength: 1,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          style: TextStyle(fontSize: 16.sp),
          onChanged: onChanged ?? (String){},
          keyboardType: TextInputType.number,
          // obscureText: true,
          textAlign: TextAlign.center,
          decoration:kOTPInputDecoration.copyWith(contentPadding: EdgeInsets.all(2.w)),
        ));
  }
}