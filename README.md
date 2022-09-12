# inc_dec_textField

This is a simple TextFormField with buttons and logic to handle factored increments/decrements and with some additional properties like Negative value allow and show currency.

## Getting Started

1. Install the latest version of the package by adding it to `pubspec.yaml`.

2. Import the `inc_dec_textField.dart` as follows `import 'package:inc_dec_textField/inc_dec_textField.dart';`.

3. Utilize the `IncDecTextField` as usual like any other flutter widget.
   
   - e.g.
     
     ```dart
      IncDecTextField(
                 controller: incDecController,
                 borderColor: Colors.grey,
                 currency: 'Day',
                 isCurrency: true,
                 isNegativeRequired: true,
        ),
     ```

## Configurable options

` IncDecTextField`widget comes with some configurable options.

| Property                    | Type                    | Purpose                                                                                    |
| --------------------------- | ----------------------- | ------------------------------------------------------------------------------------------ |
| `controller`                | `TextEditingController` | A mandatory text editing controller to be used by the TextFormField.                       |
| `isNegativeRequired`        | `bool`                  | This factor used to show negative value in TextFormField.                                  |
| `borderColor`               | `Color`                 | Border color to be used for TextFormField.                                                 |
| `textStyle`                 | `TextStyle`             | Passed down to the style attribute of TextFormField.                                       |
| `isCurrency`                | `bool`                  | This factor used to show currency value in TextFormField.                                  |
| `isShowPrefixIcon`          | `bool`                  | This factor used to Enable and Disable prefix Icon in TextFormField.                       |
| `currency`                  | `String`                | An currency value to be set to the field.                                                  |
| `prefixIcon`                | `Icon`                  | The prefix icon to be used for the display in TextFormField.                               |
| `incIcon`                   | `Icon`                  | The icon to be used for the increment button.                                              |
| `decIcon`                   | `Icon`                  | The icon to be used for the decrement button.                                              |
