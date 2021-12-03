import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propel/geolocator_service.dart';
import 'package:propel/services.dart';
import 'package:propel/theme.dart';
import 'models.dart';

class BookService extends StatefulWidget {
  final Garage? garage;
  const BookService({Key? key,this.garage}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState(this.garage);
}

class _BookServiceState extends State<BookService> {
  Garage? garage;
  _BookServiceState(this.garage);

  final TextEditingController carModelController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String name = "",model = "",phoneNumber = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Book Service",style: GoogleFonts.montserrat(),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Center(
                child: Text(garage!.title, style: GoogleFonts.montserrat(
                  color: Colors.white.withOpacity(0.85),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Form(
                  child: TextFormField(
                    controller: nameController,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w700),
                    cursorColor: Colors.white70,
                    autofillHints: const [AutofillHints.name],
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                      prefixIcon: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white70,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          nameController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded,color: Colors.white70,),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      labelText: "Full Name",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (val){
                      name = val;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Form(
                  child: TextFormField(
                    controller: phoneNumberController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w700),
                    cursorColor: Colors.white70,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    decoration: InputDecoration(
                      prefixText: '+91 ',
                      prefixStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w700),
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        color: Colors.white70,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          phoneNumberController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded,color: Colors.white70,),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      labelText: "Phone Number",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (val){
                      phoneNumber = val;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 75.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Form(
                  child: TextFormField(
                    controller: carModelController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w700),
                    cursorColor: Colors.white70,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                      prefixIcon: const Icon(
                        Icons.car_rental,
                        color: Colors.white70,
                        size: 25,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.transparent),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          carModelController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded,color: Colors.white70,),
                      ),
                      labelText: "Car Model Number",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (val){
                      model = val;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: size.width * 0.4,
                    child: OutlinedButton(
                      onPressed: () {
                        phoneNumberController.clear();
                        carModelController.clear();
                        nameController.clear();
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text("CANCEL",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: 1.5,
                              color: primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: size.width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        if(Validator.validateName(nameController.value.text) == null &&
                            Validator.validateModel(carModelController.value.text) == null &&
                            Validator.validatePhoneNumber(phoneNumberController.value.text) == null){
                          sendEmail(
                              toName: garage!.title, // Garage name
                              toEmail: garage!.email, // Garage email-id
                              fromName: "Team Propel", // Team Propel
                              fromEmail: "fegandhi1998@gmail.com", // Propel email-id
                              subject: "Service Request", // Subject of the email
                              //Message Details here
                              msgName: name,
                              msgPhone: phoneNumber,
                              msgModel: model,
                              msgAddress: address
                          );
                          displaySnackBar(context);
                          //Navigator.of(context).pop();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      child: Text(
                        "CONFIRM",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.verified_outlined,color: Colors.white,),
          const Spacer(),
          Text("Your request has been sent to " + garage!.email.toString()),
        ],
      ),
    );
    scaffoldKey.currentState!.showSnackBar(snackBar);
  }

}
