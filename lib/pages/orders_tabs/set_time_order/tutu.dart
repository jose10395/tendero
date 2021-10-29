import 'package:flutter/material.dart';

class RadioItem {
  int id;
  String title;
  dynamic data;
  RadioItem({
    @required this.id,
    @required this.title,
    this.data,
  });
}

class RadioGroup extends StatefulWidget {
  const RadioGroup({
    Key key,
    @required this.items,
    @required this.onSelected,
    this.itemSelect,
    this.style,
  }) : super(key: key);

  final List<RadioItem> items;
  final Function(RadioItem valueCheck, int item) onSelected;
  final int itemSelect;
  final GroupStyle style;

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int _itemActive;
  GroupStyle _groupStyle;

  @override
  void initState() {
    setState(() {
      _itemActive = widget.itemSelect ?? -1;
      _groupStyle = widget.style ?? GroupStyle();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.map((item) {
        final pos = widget.items.indexOf(item);
        return InkWell(
          onTap: () {
            setState(() {
              _itemActive = pos;
              widget.onSelected(item, pos);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: _groupStyle.sizeRadio,
                      height: _groupStyle.sizeRadio,
                      decoration: BoxDecoration(
                        color: _groupStyle.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width:
                          _groupStyle.sizeRadio * _groupStyle.sizePercentCheck,
                      height: _groupStyle.sizeRadio,
                      decoration: BoxDecoration(
                        color: _itemActive == pos
                            ? _groupStyle.activeColor
                            : _groupStyle.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    item.title,
                    textAlign: _groupStyle.titleAlign,
                    style: _groupStyle.titleStyle,
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class GroupStyle {
  Color activeColor;
  Color backgroundColor;
  TextStyle titleStyle;
  TextAlign titleAlign;
  double sizeRadio;
  double sizePercentCheck;

  GroupStyle({
    this.activeColor = const Color(0XFFFFA100),
    this.backgroundColor = const Color(0XFF3CAA34),
    this.titleStyle,
    this.titleAlign = TextAlign.left,
    this.sizeRadio = 40.0,
    this.sizePercentCheck = 0.60,
  }) {
    if (titleStyle == null) {
      titleStyle = TextStyle(
        color: Color(0XFF263377),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
    }
  }
}
