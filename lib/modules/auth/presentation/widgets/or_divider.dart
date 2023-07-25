import 'package:flutter/material.dart';

import '../../../../core/presentation/resources/colors.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width:double.infinity,
      child: Row(
        children: <Widget>[
          // buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Or continue with",
            ),
          ),
          // buildDivider(),
        ],
      ),
    );
  }

  // Expanded buildDivider() {
  //   return  Expanded(
  //     child: Divider(
  //       color: ,
  //       height: 1.5,
  //     ),
  //   );
  // }
}
