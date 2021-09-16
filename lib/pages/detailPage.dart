import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/facility.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/pages/error_page.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/facilitiesCard.dart';
import 'package:flutter_cozy/widgets/star.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String urlString) async {
      if (await canLaunch(urlString)) {
        launch(urlString);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.image,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackText.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: '\$${space.price}',
                                      style: purpleText.copyWith(fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style:
                                              greyText.copyWith(fontSize: 16),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5]
                                  .map(
                                    (e) => StarIcon(
                                        index: e, rating: space.rating),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Main Facilities',
                          style: regularText.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityCard(
                              Facility(
                                amount: space.kitchens,
                                title: 'kitchen',
                                image: 'assets/images/kitchen.png',
                              ),
                            ),
                            FacilityCard(
                              Facility(
                                amount: space.bedrooms,
                                title: 'bedroom',
                                image: 'assets/images/bed.png',
                              ),
                            ),
                            FacilityCard(
                              Facility(
                                amount: space.cupboards,
                                title: 'Big Lemari',
                                image: 'assets/images/cupboard.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Photos',
                          style: regularText.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((e) {
                            return Container(
                              padding: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  e,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Location',
                          style: regularText.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyText.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(space.map);
                              },
                              child: Image.asset(
                                'assets/images/btn_location.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl('tel:${space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteText.copyWith(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: purpleColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
