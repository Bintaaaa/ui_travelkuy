import 'package:basic_implement_ui_3/constans/color_constans.dart';
import 'package:basic_implement_ui_3/constans/style_constans.dart';
import 'package:basic_implement_ui_3/models/carousel_model.dart';
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
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
