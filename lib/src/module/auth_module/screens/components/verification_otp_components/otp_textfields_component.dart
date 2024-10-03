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
          SingleOTPTextfieldWidget(
            hintText: "0",
            controller: widget._store.firstCodeEditingController,
            onChanged: (value) {
              if (value.length == 1) {
                widget._store.otp.value += value;
                FocusScope.of(context).nextFocus();
              } else {
                widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                FocusScope.of(context).unfocus();
              }
            },
            focusNode: widget._store.firstCodeFocusNode,
            textInputAction: TextInputAction.done,
          ),
          SingleOTPTextfieldWidget(
            hintText: "0",
            controller: widget._store.secondCodeEditingController,
            onChanged: (value) {
              if (value.length == 1) {
                widget._store.otp.value += value;
                FocusScope.of(context).nextFocus();
              } else {
                widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                FocusScope.of(context).previousFocus();                              
              }
            },
            focusNode: widget._store.secondCodeFocusNode,
            textInputAction: TextInputAction.done,
          ),
          SingleOTPTextfieldWidget(
            hintText: "0",
            controller: widget._store.thirdCodeEditingController,
            onChanged: (value) {
              if (value.length == 1) {
                widget._store.otp.value += value;
                FocusScope.of(context).nextFocus();
              } else {
                widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                FocusScope.of(context).previousFocus();                              
              }
            },
            focusNode: widget._store.thirdCodeFocusNode,
            textInputAction: TextInputAction.done,
          ),
          SingleOTPTextfieldWidget(
            hintText: "0",
            controller: widget._store.fourthCodeEditingController,
            onChanged: (value) {
              if (value.length == 1) {
                widget._store.otp.value += value;
                FocusScope.of(context).unfocus();
              } else {
                widget._store.otp.value = widget._store.otp.value.substring(0, widget._store.otp.value.length - 1);
                FocusScope.of(context).previousFocus();                              
              }
            },
            focusNode: widget._store.fourthCodeFocusNode,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}