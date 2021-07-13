import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  List<String> listOfTitle;
  int switchValue;
  double height;
  ValueChanged<int> onStatusChanged;
  Color color, selectedColor;

  CustomToggle(
      {this.listOfTitle,
      this.switchValue,
      this.onStatusChanged,
      this.height = 50,
      this.color,
      this.selectedColor});
  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme ??= Theme.of(context);
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.listOfTitle.length, (index) {
          return Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              height: widget.height,
              decoration: widget.switchValue == index
                  ? BoxDecoration(
                      color: Colors.lightBlue,
                      // color:
                      //     widget.color == null ? theme.cardColor : widget.color,

                      borderRadius: BorderRadius.circular(30),
                    )
                  : BoxDecoration(),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (widget.switchValue != index) {
                        widget.onStatusChanged(index);
                        widget.switchValue = index;
                      }
                    });
                  },
                  child: Text(
                    "${widget.listOfTitle[index]}",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headline1.copyWith(
                        color: widget.switchValue == index
                            ? (widget.selectedColor == null
                                ? theme.textTheme.subtitle2.color
                                : widget.selectedColor)
                            : theme.textTheme.bodyText1.color,
                        fontWeight: widget.switchValue == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
