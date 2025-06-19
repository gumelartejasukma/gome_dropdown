[![pub package](https://img.shields.io/pub/v/gome_dropdown.svg)](https://pub.dev/packages/gome_dropdown)

# gome_dropdown

A reusable, customizable `Dropdown<T>` widget for Flutter projects. Works well with any type and supports advanced behavior like:

- Optional arrow visibility
- Validation
- Disabled behavior
- First item handling

## Example

```dart
Dropdown<String>(
  labelText: 'Pilih status',
  items: ['Aktif', 'Nonaktif'],
  getName: (item) => item,
  onChanged: (val) => print(val),
)
```
