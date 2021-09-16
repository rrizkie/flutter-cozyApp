import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/facility.dart';
import 'package:flutter_cozy/theme.dart';

class FacilityCard extends StatelessWidget {
  final Facility facility;

  FacilityCard(this.facility);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facility.image,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: '${facility.amount} ',
              style: purpleText.copyWith(fontSize: 14),
              children: [
                TextSpan(
                  text: facility.title,
                  style: greyText.copyWith(fontSize: 14),
                ),
              ]),
        ),
      ],
    );
  }
}
