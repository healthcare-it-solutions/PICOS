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

import 'package:picos/models/daily.dart';
import 'package:picos/models/weekly.dart';

/// A data model storing daily and weekly values for the user.
class Values {
  /// Creates a MyValues object.
  Values({
    required this.dailyList,
    required this.weeklyList,
  });

  /// Daily list.
  List<Daily>? dailyList;

  /// Weekly list.
  List<Weekly>? weeklyList;
}
