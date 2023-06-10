library flutter_radio_button_group;

/*
Purpose: defines the package: flutter_radio_button_group
Copyright (C) <10/05/19>  <Edin Spiegel>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>
*/

import 'package:flutter/material.dart';

class FlutterRadioButtonGroup extends StatefulWidget {
  final List<String> items;
  final double? size;
  final int? initialSelection;
  final Color? activeColor;
  final Color? checkColor;
  final double? distanceToNextItem;
  final double? distanceToCheckBox;
  final Color? borderColor;
  final double? borderSize;
  final IconData? checkIcon;
  final double? checkIconSize;
  final Color? checkIconColor;
  final TextStyle? textStyle;
  final Color? uncheckedFillColor;
  final double? uncheckedIconSize;
  final Color? uncheckedIconColor;
  final IconData? uncheckedIcon;

  final void Function(String selected) onSelected;

  FlutterRadioButtonGroup(
      {required this.items,
        required this.onSelected,
        this.initialSelection,
        this.size,
        this.activeColor,
        this.checkColor,
        this.distanceToNextItem,
        this.borderColor,
        this.distanceToCheckBox,
        this.borderSize,
        this.checkIcon,
        this.checkIconColor,
        this.checkIconSize,
        this.textStyle,
        this.uncheckedFillColor,
        this.uncheckedIcon,
        this.uncheckedIconColor,
        this.uncheckedIconSize});

  @override
  _FlutterRadioButtonGroupState createState() => _FlutterRadioButtonGroupState(
      this.items,
      this.onSelected,
      this.initialSelection,
      this.size,
      this.activeColor,
      this.checkColor,
      this.distanceToNextItem,
      this.borderColor,
      this.distanceToCheckBox,
      this.borderSize,
      this.checkIcon,
      this.checkIconColor,
      this.checkIconSize,
      this.textStyle,
      this.uncheckedFillColor,
      this.uncheckedIcon,
      this.uncheckedIconColor,
      this.uncheckedIconSize);
}

class _FlutterRadioButtonGroupState extends State<FlutterRadioButtonGroup> {
  int checked = 0;

  final List<String> items;
  final int? initialSelection;
  final double? size;
  final Color? activeColor;
  final Color? checkColor;
  final double? distanceToNextItem;
  final double? distanceToCheckBox;
  final Color? borderColor;
  final double? borderSize;
  final IconData? checkIcon;
  final double? checkIconSize;
  final Color? checkIconColor;
  final TextStyle? textStyle;
  final Color? uncheckedFillColor;
  final double? uncheckedIconSize;
  final Color? uncheckedIconColor;
  final IconData? uncheckedIcon;

  final void Function(String selected) onSelected;

  _FlutterRadioButtonGroupState(
      this.items,
      this.onSelected,
      this.initialSelection,
      this.size,
      this.activeColor,
      this.checkColor,
      this.distanceToNextItem,
      this.borderColor,
      this.distanceToCheckBox,
      this.borderSize,
      this.checkIcon,
      this.checkIconColor,
      this.checkIconSize,
      this.textStyle,
      this.uncheckedFillColor,
      this.uncheckedIcon,
      this.uncheckedIconColor,
      this.uncheckedIconSize);

  @override
  void initState() {
    super.initState();
    this.checked = initialSelection ?? 0;
  }

  List<Widget> returnWidgets() {
    List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(Padding(
        padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0.0 : 8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              checked = i;
            });
            onSelected(items[i].toString());
          },
          child: Row(
            children: <Widget>[
              ClipOval(
                child: SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: borderSize ?? 1.0,
                        color: borderColor == null
                            ? (Colors.grey[500]!)
                            : (borderColor ?? Colors.transparent),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: size == null ? 25.0 : size,
                    height: size == null ? 25.0 : size,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: checked == i
                            ? activeColor == null ? Colors.green : activeColor
                            : uncheckedFillColor,
                      ),
                      child: Center(
                        child: checked == i
                            ? Icon(
                          checkIcon == null ? Icons.check : checkIcon,
                          color: checkIconColor == null
                              ? Colors.white
                              : checkIconColor,
                          size: checkIconSize == null
                              ? 20.0
                              : checkIconSize,
                        )
                            : uncheckedIcon == null
                            ? Container()
                            : Center(
                          child: Icon(
                            uncheckedIcon,
                            color: uncheckedIconColor == null
                                ? Colors.grey
                                : uncheckedIconColor,
                            size: uncheckedIconSize == null
                                ? 20.0
                                : uncheckedIconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(
                      distanceToCheckBox ?? 4.0)),
              Text(
                "${items[i]}",
                style: textStyle,
              )
            ],
          ),
        ),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: returnWidgets(),
    );
  }
}
