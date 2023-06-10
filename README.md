# flutter_radio_button_group

Radio Buttons for people how like to change the Design for their own needs.

## Getting Started

### Example:

![radio button example image](https://github.com/edin45/flutter_radio_button_group/blob/master/images/example_image.png?raw=true)

### Importing:  

```
dependencies:
  flutter_radio_button_group: ^0.0.2+3
```

### Code Example:

```
import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FlutterRadioButtonGroup(
          items: [
            "Banana",
            "Mango",
            "Apple",
            "Pineapple",
          ],
          onSelected: (String selected) {
            print("Selected: $selected");
          }),
    );
  }
}
```
