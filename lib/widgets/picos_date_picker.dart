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
import 'package:picos/widgets/picos_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../themes/global_theme.dart';

/// Allows a user to pick a date.
class PicosDatePicker extends StatefulWidget {
  /// PicosDatePicker constructor.
  const PicosDatePicker({
    required this.callBackFunction,
    Key? key,
    this.dateHint = '',
    this.dateHintSuffix = '',
  }) : super(key: key);

  /// The function that is executed when a date gets selected.
  final Function(DateTime value) callBackFunction;

  /// The hint to be shown when the field is empty.
  final String dateHint;

  /// The suffix to be shown behind the date.
  final String dateHintSuffix;

  @override
  State<PicosDatePicker> createState() => _PicosDatePickerState();
}

class _PicosDatePickerState extends State<PicosDatePicker> {
  static GlobalTheme? globalTheme;

  //State
  DateTime? _date;
  String? _hint;

  String _buildHint() {
    if (widget.dateHint.isEmpty) {
      _hint = AppLocalizations.of(context)!.selectDate;
    }

    if (_date == null) {
      return _hint!;
    }

    // ignore: lines_longer_than_80_chars
    return '${_date!.day}.${_date!.month}.${_date!.year}${widget.dateHintSuffix}';
  }

  @override
  Widget build(BuildContext context) {
    if (globalTheme == null) {
      globalTheme = Theme.of(context).extension<GlobalTheme>();
      _hint = widget.dateHint;
    }

    return PicosTextField(
      hint: _buildHint(),
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                dialogBackgroundColor: globalTheme!.bottomNavigationBar!,
                colorScheme: ColorScheme.light(
                  primary: globalTheme!.darkGreen1!,
                ),
              ),
              child: child!,
            );
          },
        );

        if (date != null) {
          setState(() {
            _date = date;
          });

          widget.callBackFunction(_date!);
        }
      },
      readOnly: true,
    );
  }
}
