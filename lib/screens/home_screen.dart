import 'package:basic_implement_ui_3/constans/color_constans.dart';
import 'package:basic_implement_ui_3/constans/style_constans.dart';
import 'package:basic_implement_ui_3/models/carousel_model.dart';
import 'package:basic_implement_ui_3/models/popular_destination_model.dart';
import 'package:basic_implement_ui_3/models/travelog_model.dart';
import 'package:basic_implement_ui_3/widgets/bottom_navigation_travelkuy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for(var i=0;i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //setting Appbar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
          elevation: 0 ,//for delete shadow
        ),
      backgroundColor: mBackgroundColor,
      bottomNavigationBar: BottomNavigationTravelkuy(),


      //body
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //promos
            Padding(
                padding:  EdgeInsets.only(left: 20, bottom: 20),
                child: Text("Hi, Bijantyum ✌ this promos just for You!",
                  style: mTitleStyle,
                ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16,right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index){
                        setState(() {
                          _current = index;
                        },);
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context,index){
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                carousels[index].image
                              ),
                              fit: BoxFit.cover
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(
                          carousels,
                            (index,image){
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? mBlueColor
                                    : mGreyColor
                              ),
                            );
                            }
                        ),
                      ),
                      //More Text
                      Text(
                        "More...",
                        style: mMoreDiscountStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16, top: 22,bottom: 16),
              child: Text("Let\'s Booking!",
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16,right: 16,bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: mBorderColor,
                              width: 1
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_train_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Trains',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Intercity',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: mBorderColor,
                                width: 1
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_flight_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Flight",
                                        style: mServiceTitleStyle
                                    ),
                                    Text("Feel freedom",
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: mBorderColor,
                                width: 1
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_hotel_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Hotel',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Let\'s take a break',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: mBorderColor,
                                width: 1
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_car_rental_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Car Rental',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Around the city',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding:  EdgeInsets.only(left: 16, top: 22,bottom: 16),
                child: Text("Popular Destinations!",
                style: mTitleStyle,
                ),
            ),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              populars[index].image,
                              height: 74,
                            ),
                            Text(
                              populars[index].name,
                              style: mPopularDestinationTitleStyle,
                            ),
                            Text(
                              populars[index].country,
                              style: mPopularDestinationSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16, top: 22,bottom: 16),
              child: Text("Travelog!",
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 210,
              child: ListView.builder(
                itemCount: travlogs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 144,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(travlogs[index].image),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset('assets/svg/travlog_top_corner.svg'),
                              right: 0,
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: SvgPicture.asset('assets/svg/travelkuy_logo_white.svg'),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset('assets/svg/travlog_bottom_gradient.svg'),
                            ),
                            Positioned(
                                child: Text(travlogs[index].name,
                                style: mTravlogTitleStyle ,
                                ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Text(travlogs[index].content,
                        maxLines: 3,
                          style: mTravlogContentStyle,
                        ),
                        SizedBox(height: 8,),
                        Text(travlogs[index].place,
                          style: mTravlogPlaceStyle,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
