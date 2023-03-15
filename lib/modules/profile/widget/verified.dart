import 'package:flutter/material.dart';

import '../../../core/presentation/resources/size_constants.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
      decoration: BoxDecoration(
        color: const Color(0xffF46817).withOpacity(0.10),
        border: Border.all(
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        'verified',
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: const Color(0xffFFA500)),
      ),
    );
  }
}