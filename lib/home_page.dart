import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:propel/geolocator_service.dart';
import 'package:propel/theme.dart';
import 'models.dart';
import 'nearby_garages.dart';
import 'puncture.dart';
import 'fuelstation.dart';
import 'chargingstation.dart';
import 'hiredriver.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max;
    if ((size.height > size.width)) {
      max = size.height;
    } else {
      max = size.width;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("PROPEL",
              style: GoogleFonts.montserrat(
                letterSpacing: 1.5,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.local_activity_outlined,color: Colors.white,),
              onPressed: (){
                //Open App Drawer here
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active_outlined,color: Colors.white,),
              onPressed: (){
                //Open Notifications here
              },
            ),
            const SizedBox(width: 10,),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.location_on, color: Colors.white,),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 0.7 * size.width,
                        child: Text( "Please enable location services", // Change this to Address variable after implementing location logic
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: IconButton(
                          onPressed: (){
                            getLocation();
                          },
                          icon: const Icon(Icons.refresh),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              makeCarousel(bannerList),
              const SizedBox(height: 10,),
              makeServices("Unplanned Services",unplannedServices,Icons.settings_applications),
              const SizedBox(height: 10,),
              makeGarageCard(
                Image.asset("assets/images/garage.png",fit: BoxFit.fitWidth,),
                "GARAGES", (){ Navigator.push(context, new MaterialPageRoute(builder: (context) => NearbyGarages())); },
              ),
              const SizedBox(height: 10,),
              makeCarousel(adList),
              const SizedBox(height: 10,),
              makeServices("Popular Car Brands",carBrands,Icons.car_repair),
              const SizedBox(height: 10,),
              makeServices("Planned Services",plannedServices,Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeCarousel(List<Image?> list){
    Size size = MediaQuery.of(context).size;
    double max,min;
    if ((size.height > size.width)) {
      max = size.height;
      min = size.width;
    } else {
      min = size.height;
      max = size.width;
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 0.5 * min,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        disableCenter: true,
      ),
      items: list.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            width: 0.5 * max,
            height: 0.3 * max,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 0.0),
                ),
                child: card,
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget makeGarageCard(Image image, String title, var onPressed){
    Size size = MediaQuery.of(context).size;
    double wt,ht;
    if ((size.height > size.width)) {
      ht = size.height;
      wt = size.width;
    } else {
      wt = size.height;
      ht = size.width;
    }
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          width:  wt * 0.95,
          height: 0.15 * size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.purple.shade800,
                Colors.purple.shade500 ,
                Colors.purple.shade300],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NEARBY",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(title ,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.125 * ht,
                  width: 0.125 * ht,
                  child: image,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeServices(String title, List<Services> services, IconData icon){
    Size size = MediaQuery.of(context).size;
    double max;
    if ((size.height > size.width)) {
      max = size.height;
    } else {
      max = size.width;
    }
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10,),
                Icon(icon, color: Colors.white,),
                const SizedBox(width: 10,),
                Text(title,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: 0.145 * max,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: unplannedServices.length,
                  itemBuilder: (BuildContext context, int i){
                    return SizedBox(
                      height: 0.15 * size.height,
                      width: 0.35 * size.width,
                      child: GestureDetector(
                        onTap: (){// After clicking Puncture,Fuel Station etc.
                          if(services[i].title == "Puncture"){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => Puncture()));
                          }
                          if(services[i].title == "Fuel Station"){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => fuelstation()));
                          }
                          if(services[i].title == "Charging Station"){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => chargingstation()));
                          }
                          if(services[i].title == "Hire Driver"){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => hiredriver()));
                          }
                        },
                        child: makeServicesCards( services[i].title, services[i].image),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeServicesCards(String title, Image? image){
    Size size = MediaQuery.of(context).size;
    double max,min;
    if ((size.height > size.width)) {
      max = size.height;
      min = size.width;
    } else {
      min = size.height;
      max = size.width;
    }
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 0.1 * max,
            width: 0.3 * min,
            child: image,
          ),
          const SizedBox(height: 5,),
          Center(
            child: Text(title,
              style: GoogleFonts.montserrat(
                fontSize: 11.5,
                color: Colors.black87,
              ),
            overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

}
