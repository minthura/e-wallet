import 'package:flutter/material.dart';
import 'package:my_vault/components/pin_digit_text_field.dart';

class SixDigitDisplay extends StatefulWidget {
  final Function onFilled;
  const SixDigitDisplay({Key key, this.onFilled}) : super(key: key);

  @override
  _SixDigitDisplayState createState() => _SixDigitDisplayState();
}

class _SixDigitDisplayState extends State<SixDigitDisplay> {
  int _currentIndex = 0;
  List<bool> _textControllers = [];
  @override
  void initState() {
    super.initState();
    _textControllers.add(false);
    _textControllers.add(false);
    _textControllers.add(false);
    _textControllers.add(false);
    _textControllers.add(false);
    _textControllers.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PinDigitTextField(
              isActive: _textControllers[0],
            ),
            PinDigitTextField(
              isActive: _textControllers[1],
            ),
            PinDigitTextField(
              isActive: _textControllers[2],
            ),
            PinDigitTextField(
              isActive: _textControllers[3],
            ),
            PinDigitTextField(
              isActive: _textControllers[4],
            ),
            PinDigitTextField(
              isActive: _textControllers[5],
            ),
          ],
        ),
        Expanded(
          child: Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.6),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 11) {
                  return IconButton(
                    icon: Icon(Icons.backspace),
                    onPressed: () {
                      onClick(index);
                    },
                  );
                } else if (index == 9) {
                  return Container();
                } else {
                  return FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.grey.shade300,
                    onPressed: () => onClick(index),
                    child: Text(
                      index == 10 ? '0' : '${index + 1}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }

  void onClick(int index) {
    if (index == 11) {
      if (_currentIndex == 0) {
        return;
      }
      _currentIndex--;
      setState(() {
        _textControllers[_currentIndex] = false;
      });
    } else {
      if (_currentIndex == 6) {
        return;
      }
      setState(() {
        _textControllers[_currentIndex] = true;
      });
      _currentIndex++;
      if (_currentIndex == 6) {
        widget.onFilled();
      }
    }
  }
}
