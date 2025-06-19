import 'package:flutter/material.dart';

class Dropdown<T> extends StatefulWidget {
  final String? labelText;
  final List<T> items;
  final String Function(T item) getName;
  final void Function(T? item)? onChanged;
  final bool Function(T? item)? isDisableChange;
  final T? selectedValue;
  final bool disabled;
  final bool isDisabledFirstOnInit;
  final String? Function(T? item)? validator;
  final bool? isHideArrowOnNull;

  const Dropdown({
    super.key,
    this.labelText,
    required this.items,
    required this.getName,
    this.selectedValue,
    this.onChanged,
    this.disabled = false,
    this.isDisabledFirstOnInit = false,
    this.isDisableChange,
    this.validator,
    this.isHideArrowOnNull,
  });

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  T? selectedValue;
  bool isRefresh = false;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.selectedValue ??
        ((widget.isDisabledFirstOnInit && widget.items.length > 1)
            ? null
            : widget.items.firstOrNull);
  }

  @override
  Widget build(BuildContext context) {
    final safeValue =
        widget.items.any((item) => item == selectedValue)
            ? selectedValue
            : (widget.isDisabledFirstOnInit && widget.items.length > 1)
            ? null
            : widget.items.firstOrNull;
    return DropdownButtonFormField<T>(
      key: Key('$safeValue$isRefresh'),
      validator: widget.validator,
      value: safeValue,
      isExpanded: true,
      iconSize:
          ((widget.isHideArrowOnNull ?? false) && safeValue == null) ||
                  widget.disabled ||
                  widget.items.length <= 1
              ? 0
              : 24,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
      items:
          widget.items.map((e) {
            return DropdownMenuItem<T>(
              value: e,
              child: Text(
                widget.getName(e),
                overflow: TextOverflow.visible,
                softWrap: true,
                maxLines: 3,
              ),
            );
          }).toList(),
      selectedItemBuilder: (context) {
        return widget.items.map((e) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.getName(e),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
            ),
          );
        }).toList();
      },
      onChanged:
          widget.disabled || widget.items.length <= 1
              ? null
              : (value) {
                if (widget.isDisableChange != null) {
                  if (widget.isDisableChange!(value)) {
                    setState(() {
                      isRefresh = !isRefresh;
                    });
                    return;
                  }
                }
                setState(() {
                  selectedValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
    );
  }

  // }
}
