import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/countries.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.model,
    Key? key,
  }) : super(key: key);

  final model;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: Cities.citySelected,
      items: Cities.citiesInTheWorld
          .map(
            (String city) => DropdownMenuItem(
              value: city,
              child: Text(
                city,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff36424D),
                  height: 1.5,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (String? newCity) async {
        model.selectedCity(newCity!);
      },
    );
  }
}
