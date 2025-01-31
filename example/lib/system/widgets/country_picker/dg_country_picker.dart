import 'package:country_picker/country_picker.dart';
import 'package:dghub/system/tools/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

countryPicker(
    {required BuildContext context,
    required Function(Country country) onResult}) {
  final theme = Theme.of(context);
  return showCountryPicker(
    countryListTheme: CountryListThemeData(
      inputDecoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.background,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.grey),
          hintText: 'Search'),
      searchTextStyle:
          TextStyle(color: context.isDarkTheme ? Colors.white : Colors.black),
      borderRadius: BorderRadius.circular(30),
      backgroundColor: theme.cardColor,
      textStyle:
          TextStyle(color: context.isDarkTheme ? Colors.white : Colors.black),
    ),
    context: context,
    showPhoneCode: true, // optional. Shows phone code before the country name.
    onSelect: (Country country) {
      onResult(country);
      if (kDebugMode) {
        print(country.countryCode);

        print(country.displayName);
        print(country.displayNameNoCountryCode);
        print(country.e164Key);
        print(country.e164Sc);
        print(country.example);
        print(country.fullExampleWithPlusSign);
      }
    },
  );
}
