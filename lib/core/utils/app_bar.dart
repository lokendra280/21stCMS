import 'package:flutter/material.dart';

import '../presentation/resources/size_constants.dart';
import '../presentation/widget/forms/textfields.dart';

class AppBars extends AppBar {
  AppBars()
      : super(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            "Kathmandu",
            style: TextStyle(
              color: Color.fromRGBO(65, 65, 65, 1),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => null,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SC.mW, vertical: SC.mH),
              child: PrimaryTextField(
                onSaved: (_) {},
                hintTxt: 'Search for a service',
                suffixIcon: const Icon(Icons.search_sharp),
              ),
            ),
          ),
        );
}
