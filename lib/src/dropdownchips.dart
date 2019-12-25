library dropdownchips;

import 'package:flutter/material.dart';

class DropdownChips extends StatefulWidget {
  final List<String> dropdownList;
  final Decoration dropdownDecoration;
  final String hint;
  final Icon addIcon;
  final double addIconSize;
  final Color addIconColor;
  final Icon deleteIcon;
  final ShapeBorder chipShape;
  final TextStyle chipTextStyle;
  final Color chipColor;

  DropdownChips({
    @required this.dropdownList,
    this.dropdownDecoration,
    this.hint = "Click here",
    this.addIcon,
    this.addIconSize = 35.0,
    this.addIconColor = Colors.grey,
    this.deleteIcon,
    this.chipShape,
    this.chipTextStyle,
    this.chipColor = Colors.white,
  });

  @override
  _DropdownChips createState() => _DropdownChips();
}

class _DropdownChips extends State<DropdownChips> {
  List<String> itemList = new List();
  String val;
  String hintText = 'widget.hint';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width - 75,
                child: Container(
                  decoration: widget.dropdownDecoration == null
                      ? ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        )
                      : widget.dropdownDecoration,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(
                        '   ' + widget.hint,
                        style: TextStyle(),
                      ),
                      items: widget.dropdownList.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          val = value;
                          hintText = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: widget.addIcon == null
                      ? Icon(
                          Icons.add_circle_outline,
                          size: widget.addIconSize,
                        )
                      : widget.addIcon,
                  color: widget.addIconColor,
                  onPressed: () {
                    setState(() {
                      itemList.add(val);
                    });
                  },
                ),
              ),
            ],
          ),
          Wrap(
            children: itemList
                .map(
                  (value) => Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Chip(
                      backgroundColor: widget.chipColor,
                      label: Text(
                        value,
                        style: widget.chipTextStyle == null
                            ? TextStyle(fontSize: 13)
                            : widget.chipTextStyle,
                      ),
                      shape: widget.chipShape == null
                          ? ContinuousRectangleBorder()
                          : widget.chipShape,
                      deleteIcon: widget.deleteIcon == null
                          ? Icon(Icons.clear, size: 16.0)
                          : widget.deleteIcon,
                      onDeleted: () {
                        setState(() {
                          itemList.remove(value);
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
