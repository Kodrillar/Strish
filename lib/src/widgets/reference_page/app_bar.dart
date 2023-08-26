import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ReferenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReferenceAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        'Reference',
        style: kTextStyle,
      ),
      leading: Builder(
        builder: (BuildContext context) => IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
