/*   This file is part of Picos, a health tracking mobile app
*    Copyright (C) 2022 Healthcare IT Solutions GmbH
*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:flutter/material.dart';
import 'package:picos/themes/global_theme.dart';
import 'package:picos/widgets/picos_svg_icon.dart';

import 'questionaire_page.dart';

/// A cover for the different sections of the questionaire.
class Cover extends StatelessWidget {
  /// Constructs the cover page.
  const Cover({
    required this.title,
    required this.image,
    required this.backFunction,
    required this.nextFunction,
    Key? key,
  }) : super(key: key);

  /// The title cover.
  final String title;

  /// Contains the annotation for the image.
  final String image;

  /// Function for getting a page back.
  final void Function()? backFunction;

  /// Function for getting the next page.
  final void Function()? nextFunction;

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        kToolbarHeight;
    double? width = MediaQuery.of(context).size.width;
    double? fontSize = 30;
    GlobalTheme theme = Theme.of(context).extension<GlobalTheme>()!;

    return QuestionairePage(
      nextFunction: nextFunction,
      backFunction: backFunction,
      color: theme.darkGreen1!,
      child: SizedBox(
        width: width,
        height: height - (45 + 15 + 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height / 8,
            ),
            PicosSvgIcon(
              assetName: image,
              height: 200,
              width: 170,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
