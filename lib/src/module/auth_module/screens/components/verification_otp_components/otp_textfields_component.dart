import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import '../../../_stores/verification_otp_store.dart';
import '../../../../../core/presenter/common/widgets/single_otp_textfield_widget.dart';

class OTPTetfieldsComponent extends StatefulWidget {
  OTPTetfieldsComponent({super.key});

  final VerificationOTPStore _store = GetIt.I.get<VerificationOTPStore>();

  @override
  State<OTPTetfieldsComponent> createState() => _OTPTetfieldsComponentState();
}

class _OTPTetfieldsComponentState extends State<OTPTetfieldsComponent> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FocusScope(
            child: SingleOTPTextfieldWidget(
              hintText: "0",
              keyboardType: TextInputType.number,
              controller: widget._store.firstCodeEditingController,
              onChanged: (value) {
                if (value.length == 1) {
                  widget._store.otp.value += value;
                  FocusScope.of(context).requestFocus(widget._store.secondCodeFocusNode);
                } else {
                  widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                  widget._store.firstCodeFocusNode.unfocus();
                }
              },
              focusNode: widget._store.firstCodeFocusNode,
              textInputAction: TextInputAction.done,
            ),
          ),
          FocusScope(
            child: SingleOTPTextfieldWidget(
              hintText: "0",
              keyboardType: TextInputType.number,
              controller: widget._store.secondCodeEditingController,
              onChanged: (value) {
                if (value.length == 1) {
                  widget._store.otp.value += value;
                  FocusScope.of(context).requestFocus(widget._store.thirdCodeFocusNode);
                } else {
                  widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                  FocusScope.of(context).requestFocus(widget._store.firstCodeFocusNode);                           
                }
              },
              focusNode: widget._store.secondCodeFocusNode,
              textInputAction: TextInputAction.done,
            ),
          ),
          FocusScope(
            child: SingleOTPTextfieldWidget(
              hintText: "0",
              keyboardType: TextInputType.number,
              controller: widget._store.thirdCodeEditingController,
              onChanged: (value) {
                if (value.length == 1) {
                  widget._store.otp.value += value;
                  FocusScope.of(context).requestFocus(widget._store.fourthCodeFocusNode);
                } else {
                  widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                  FocusScope.of(context).requestFocus(widget._store.secondCodeFocusNode);                            
                }
              },
              focusNode: widget._store.thirdCodeFocusNode,
              textInputAction: TextInputAction.done,
            ),
          ),
          FocusScope(
            child: SingleOTPTextfieldWidget(
              hintText: "0",
              keyboardType: TextInputType.number,
              controller: widget._store.fourthCodeEditingController,
              onChanged: (value) {
                if (value.trim().length == 1) {
                  widget._store.otp.value += value;
                  widget._store.fourthCodeFocusNode.unfocus();
                } else {
                  widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                  FocusScope.of(context).requestFocus(widget._store.thirdCodeFocusNode);                              
                }
              },
              focusNode: widget._store.fourthCodeFocusNode,
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}