import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/widget/base_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, themeData) {
      return Scaffold(
        // appBar: AppBar(title: Text('Notification'),),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Nottification',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
          ),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  config.verticalSpaceMedium(),
                  ProductViewListTile(),
                  config.verticalSpaceMedium(),
                  if ((index + 1) != itemCount)
                    Divider(
                      indent: 15.0,
                      height: 0.5,
                      // color: AppColors.colorBlack(0.5),
                      endIndent: 15.0,
                    )
                  else
                    Divider(
                      height: 0.5,
                      // color: AppColors.colorBlack(0.5),
                    ),
                  if (index != itemCount) config.verticalSpaceMedium(),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

// this is to show items in cart
class ProductViewListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, themeData) {
      return IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              config.horizontalSpaceSmall(),
              _buildProductDetail(),
            ],
          ),
        ),
      );
    });
  }

  // this is used by CartProductViewListTile class
  Widget _buildProductImage() {
    return BaseWidget(
      builder: (context, config, themeData) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: config.appWidth(20),
          ),
        );
      },
    );
  }

  // this is used by CartProductViewListTile class
  Widget _buildProductDetail() {
    return BaseWidget(
      builder: (context, config, themeData) {
        return Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Biggest Sale is here || 24 Hours sale. Get the latest products on sale ',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: themeData.textTheme.bodyText1
                    ?.apply(fontWeightDelta: 1, heightDelta: 0.2),
              ),
              config.verticalSpaceSmall(),
              Text(
                'Get the latest products on sale festival',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: themeData.textTheme.bodyText2?.apply(
                    // color: AppColors.colorBlack(0.4),
                    ),
              ),
              config.verticalSpaceSmall(),
              Text(
                '25, Jun 2022',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: themeData.textTheme.bodyText2?.apply(
                    // color: AppColors.(1),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
