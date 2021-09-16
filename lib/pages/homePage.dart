import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/models/tips.dart';
import 'package:flutter_cozy/providers/spaceProvider.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/buttonNav.dart';
import 'package:flutter_cozy/widgets/cityCard.dart';
import 'package:flutter_cozy/widgets/spaceCard.dart';
import 'package:flutter_cozy/widgets/tipsCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getSpacesData();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Explore Now',
                style: blackText.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Popular Cities',
                style: regularText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.only(left: 24),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      image: 'assets/images/city-1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      image: 'assets/images/city-2.png',
                      isFavorite: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      image: 'assets/images/city-3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Recommended Space',
                style: regularText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24),
                child: FutureBuilder(
                  future: spaceProvider.getSpacesData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Guidance',
                style: regularText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      date: '20 Apr',
                      image: 'assets/images/tips-1.png',
                      title: 'City Guidelines',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      date: '11 Dec',
                      image: 'assets/images/tips-2.png',
                      title: 'Jakarta Fairship',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + 48,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonNav(
              image: 'assets/images/home-icon.png',
              isActive: true,
            ),
            ButtonNav(
              image: 'assets/images/mail-icon.png',
              isActive: false,
            ),
            ButtonNav(
              image: 'assets/images/card-icon.png',
              isActive: false,
            ),
            ButtonNav(
              image: 'assets/images/love-icon.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
