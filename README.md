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
