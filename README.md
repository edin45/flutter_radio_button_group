# flutter_radio_button_group

Radio Buttons for people how like to change the Design for their own needs.

## Getting Started

### Example:

![radio button example image](https://cdn1.imggmi.com/uploads/2019/10/6/4cc62eb958077af9134c080228b580f9-full.png)

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
