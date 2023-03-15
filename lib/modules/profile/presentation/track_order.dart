import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/resources/ui_assets.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../../core/presentation/widget/forms/textfields.dart';

class TrackOrderPage extends HookConsumerWidget {
  TrackOrderPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormBuilderState>();
  String? trackingCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        title: Text(
          'Track',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: 1,
              color: const Color.fromRGBO(77, 77, 77, 1)),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(77, 77, 77, 1),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset(UIAssets.getIcon('bus.png')),
                ),
                SBC.mH,
                Text(
                  'Track Your Order',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                )
              ],
            ),
            SBC.xxLH,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Material(
                    child: FormBuilder(
                      key: _key,
                      child: PrimaryTextField(
                        onSaved: (newValue) {
                          trackingCode = newValue;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        hintTxt: 'Enter Order ID',
                      ),
                    ),
                  ),
                  SBC.xxLH,
                  PrimaryButton(
                    onPressed: () {
                      if (_key.currentState!.saveAndValidate()) {}
                    },
                    title: 'Submit',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
