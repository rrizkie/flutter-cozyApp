// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/theme.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.image,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isFavorite
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Image.asset(
                                'assets/images/star-icon.png',
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackText.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
