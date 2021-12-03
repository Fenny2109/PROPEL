import 'package:flutter/material.dart';

class Services {
  Services({
    this.title = "",
    this.image,
  });
  String title;
  Image? image;
}

class Cars {
  Cars({
    this.title = "",
    this.logo,
  });
  String title;
  Image? logo;
}

class Garage {
  Garage({
    this.title = "",
    this.email = "",
    this.address = "",
    this.phoneNo = "",
    this.rating = 4.0,
  });
  String title;
  String email;
  String address;
  String phoneNo;
  double rating;
}

List<Garage> garageList = [
  Garage(
    title: "A1 Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9898454512",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Jyoti Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9878459865",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sumit Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9845564556",
      email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sameer Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9890125472",
    email: "fagandhi1998@gmail.com",
  ),
];

List<Garage> puncturelist = [
  Garage(
    title: "B1 Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9898454512",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Jyoti Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9878459865",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sumit Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9845564556",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sameer Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9890125472",
    email: "fagandhi1998@gmail.com",
  ),
];
List<Garage> fuelstationlist = [
  Garage(
    title: "C1 Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9898454512",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Jyoti Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9878459865",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sumit Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9845564556",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sameer Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9890125472",
    email: "fagandhi1998@gmail.com",
  ),
];

List<Garage> chargingstationlist = [
  Garage(
    title: "CS1 Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9898454512",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Jyoti Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9878459865",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sumit Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9845564556",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sameer Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9890125472",
    email: "fagandhi1998@gmail.com",
  ),
];

List<Garage> hiredriverlist = [
  Garage(
    title: "Amir Patel",
    rating: 4.0,
    //address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9898454512",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Jyoti Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9878459865",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sumit Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9845564556",
    email: "fagandhi1998@gmail.com",
  ),
  Garage(
    title: "Sameer Car Garage",
    rating: 4.0,
    address: "ABC Street, Near XYZ Circle, New Delhi",
    phoneNo: "9890125472",
    email: "fagandhi1998@gmail.com",
  ),
];

List<Image?> adList = [
  Image.network(
    "https://5.imimg.com/data5/BY/FN/VE/SELLER-8211699/creative-advertising-design-service-500x500.jpg",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://drivetribe.imgix.net/QIjcmU94Q12M-O1d1UcOUw",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIY2bHZlpwkNDP-SNQvZCtYvUhSZ_w9uYTGA&usqp=CAU",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://media-assets-05.thedrum.com/cache/images/thedrum-prod/s3-img_1162--default--1280.jpg",
    fit: BoxFit.cover,
  ),
];

List<Image?> bannerList = [
  Image.network(
    "https://www.ads-value.com/adpics/5ce261fa472ae3dc1f70683f8.png",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjvNEtu-j_s5K1LT_9nAmVNoSPVnJOClFoVw&usqp=CAU",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-UIQ0fMXcAeH1eChGndKCA32co_o6TKzNGA&usqp=CAU",
    fit: BoxFit.cover,
  ),
  Image.network(
    "https://i.dawn.com/large/2017/06/5937dfc13b32c.jpg",
    fit: BoxFit.cover,
  ),
];

/*
* For quick-code purposes, I used type 'Services' only instead of type 'Cars', be sure to change it to type 'Cars' (refer models.dart),
* or any other User Defined Type that your model suggests.
*
* If you want to replace, I made a class of Cars (refer in models.dart @ line: 12).
* Like this: List<Cars> carBrands = [];
* Instead of: List<Services> carBrands = [];
*
* I used type Services because it could be implemented quickly as I already had the method for making ServiceCards,
* and as the " PlannedServices cards " are similar to " CarBrands cards ".
* (Refer home_page.dart for more info).
*/

List<Services> carBrands = [
  Services(
    title: "Hyundai",
    image: Image.network("https://pngimg.com/uploads/hyundai/hyundai_PNG11220.png"),
  ),
  Services(
    title: "Audi",
    image: Image.network("https://www.freepnglogos.com/uploads/audi-logo-2.png"),
  ),
  Services(
    title: "BMW",
    image: Image.network("https://www.freepnglogos.com/uploads/bmw-brand-logo-0.png"),
  ),
  Services(
    title: "Mercedes",
    image: Image.network("https://1000logos.net/wp-content/uploads/2018/04/Mercedes-Benz-Logo.png"),
  ),
];

List<Services> unplannedServices = [
  Services(
    title: "Puncture",
    image: Image.asset("assets/images/up3.png"),
  ),
  Services(
    title: "Fuel Station",
    image: Image.asset("assets/images/up1.png"),
  ),
  Services(
    title: "Charging Station",
    image: Image.asset("assets/images/up2.png"),
  ),
  Services(
    title: "Hire Driver",
    image: Image.asset("assets/images/up4.png"),
  ),
];

List<Services> plannedServices = [
  Services(
    title: "Car Care Center",
    image: Image.asset("assets/images/p3.png"),
  ),
  Services(
    title: "Car Accessories",
    image: Image.asset("assets/images/p1.png"),
  ),
  Services(
    title: "Car Workshop",
    image: Image.asset("assets/images/p2.png"),
  ),
  Services(
    title: "Battery Shop",
    image: Image.asset("assets/images/p4.png"),
  ),
];
