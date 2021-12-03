import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:propel/geolocator_service.dart';
import 'package:propel/book_services.dart';
import 'package:propel/theme.dart';
import 'dart:math';
import 'models.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'locations.dart' as locations;

class chargingstation extends StatefulWidget {
  const chargingstation({Key? key}) : super(key: key);

  @override
  _chargingstationState createState() => _chargingstationState();
}

class _chargingstationState extends State<chargingstation> {

  @override
  void initState() {
    //getLatLong();
    super.initState();
  }

  void launchCall(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    if (res != null) {
      print("call launch");
    }
    else {
      throw "Sorry! Could not place a call";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double wt,ht;
    if ((size.height > size.width)) {
      ht = size.height;
      wt = size.width;
    } else {
      wt = size.height;
      ht = size.width;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("ChargingStation",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          backgroundColor: bgColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.refresh),
          //     color: Colors.white,
          //     onPressed: (){
          //       print("refresh");
          //       setState(() {
          //         getLatLong();
          //       });
          //       print(lat);
          //       print(long);
          //     },
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    color: Colors.grey.shade300,
                    height: 0.65 * ht,
                    // Implement Map
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(latitude,longitude),
                        zoom: 14,
                      ),
                      zoomControlsEnabled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 0.25 * ht,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chargingstationlist.length,
                      itemBuilder: (BuildContext context, int i){
                        return GestureDetector(
                          onTap: (){},
                          child: makeGarageList(chargingstationlist[i]),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeGarageList(Garage g){
    Size size = MediaQuery.of(context).size;
    double wt,ht;
    if ((size.height > size.width)) {
      ht = size.height;
      wt = size.width;
    } else {
      wt = size.height;
      ht = size.width;
    }
    int random = Random().nextInt(chargingstationlist.length);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Colors.white12,
          height: 0.225 * ht,
          width: 0.65 * wt,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: garageColors[random],
                          radius: 25,
                          child: Text(g.title[0].toUpperCase(),style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 22,
                          ),),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(" " + g.rating.toString() + "  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(Icons.star,color: Colors.yellow,size: 18.0,),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 0.4 * wt,
                          child: Text(g.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.grey.shade100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4,),
                        SizedBox(
                          width: 0.4 * wt,
                          child: Text(g.address,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 0.25 * wt,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: (){
                          print("call");
                          launchCall(g.phoneNo);
                        },
                        child: Center(
                          child: Text("CALL NOW",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 0.3 * wt,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: (){
                          //Book Service
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => BookService(garage: g,)));
                        },
                        child: Center(
                            child: Text("BOOK SERVICE",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
