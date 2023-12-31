import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField({super.key, required this.onTapSearchField});

  final Function(String)? onTapSearchField;

  final OutlineInputBorder textFieldStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onTapSearchField,
      style:
          const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      cursorColor: GlobalVariables.selectedNavBarColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search ShopEase',
        hintStyle: const TextStyle(
            color: Colors.black45, fontWeight: FontWeight.normal),
        constraints: const BoxConstraints(maxHeight: 45, minHeight: 45),
        prefixIcon: const Icon(Icons.search),
        focusedBorder: textFieldStyle,
        enabledBorder: textFieldStyle,
        border: textFieldStyle,
        contentPadding: const EdgeInsets.only(top: 3),
      ),
    );
  }
}
