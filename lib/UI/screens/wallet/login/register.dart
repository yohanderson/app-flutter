import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widgets/funciones/snack_bar.dart';

class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/fondoblanck.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const DateRegister(),
        ],
      ),
    );
  }
}

class DateRegister extends StatefulWidget{
  const DateRegister({super.key});

  @override
  State<StatefulWidget> createState() => _DateRegister();
  }

class _DateRegister extends State<DateRegister> {
  final _Keyform = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController firstlast = TextEditingController();
  TextEditingController secondlast = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController datebirth = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController citybirth = TextEditingController();
  TextEditingController cityresidence = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController numberphone = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  bool obs = false;

  RegisterUser() async {
    try{
      await firebase.collection('Users').doc().set(
        {
          "UserName":username.text,
          "FirstName":firstname.text,
          "SecondName":secondname.text,
          "FirstLast":firstlast.text,
          "SecondLast":secondlast.text,
          "Email":email.text,
          "Password":pass.text,
          "DateBirt":datebirth.text,
          "Genero":genero.text,
          "CityBirth":citybirth.text,
          "CityResidence":cityresidence.text,
          "Nationality":nationality.text,
        }
      );
    }catch (e) {
        print('Error....'+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: Form(
      key: _Keyform,
    child: Expanded(
    child: ListView(
             children: [
                  const SizedBox(
                    height: 30,
                  ),
               const Text("Here to Get",
                 style: TextStyle (
                     fontSize: 30,
                     color: Colors.black,
                     fontWeight: FontWeight.normal
                 ),
               ),
               const Text("Welcome",
                 style: TextStyle (
                     fontSize: 40,
                     color: Colors.black,
                     fontWeight: FontWeight.normal
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               const Center(
                 child: Text("Resgistro",
                   style: TextStyle (
                       fontSize: 30,
                       color: Colors.black,
                       fontWeight: FontWeight.normal
                   ),
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               TextFormField(
                 controller: username,
                 keyboardType: TextInputType.text,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.person),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'Username',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }
                   else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
                Row(
                 children: [
                   Expanded(
                   child: TextFormField(
                     controller: firstname,
                     keyboardType: TextInputType.text,
                     style: const TextStyle(
                         color: Colors.black
                     ),
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       icon: Icon(Icons.edit),
                       isDense: false,
                       contentPadding: EdgeInsets.all(10),
                       hintText: 'First Name',
                     ),
                     validator: (value) {
                       if(value!.isEmpty){
                         return "Enter correct name";
                       }else{
                         return null;
                       }
                     },
                   ),
                   ),
                   const SizedBox(
                     width: 5,
                   ),
                   Expanded(
                     child: TextFormField(
                     controller: secondname,
                     keyboardType: TextInputType.text,
                     style: const TextStyle(
                         color: Colors.black
                     ),
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       icon: Icon(Icons.edit),
                       isDense: false,
                       contentPadding: EdgeInsets.all(10),
                       hintText: 'Second Name',
                     ),
                     validator: (value) {
                       if(value!.isEmpty){
                         return "Enter correct name";
                       }else{
                         return null;
                       }
                     },
                   ),
                   ),
                 ],
               ),
               const SizedBox(
                 height: 10,
               ),
               Row(
                 children: [
                   Expanded(
                 child: TextFormField(
                     controller: firstlast,
                     keyboardType: TextInputType.text,
                     style: const TextStyle(
                         color: Colors.black
                     ),
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       icon: Icon(Icons.edit),
                       isDense: false,
                       contentPadding: EdgeInsets.all(10),
                       hintText: 'First last',
                     ),
                     validator: (value) {
                       if(value!.isEmpty){
                         return "Enter correct name";
                       }else{
                         return null;
                       }
                     },
                   ),
                   ),
                   const SizedBox(
                     width: 10,
                   ),
                   Expanded(
                     child: TextFormField(
                     controller: secondlast,
                     keyboardType: TextInputType.text,
                     style: const TextStyle(
                         color: Colors.black),
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       icon: Icon(Icons.edit),
                       isDense: false,
                       contentPadding: EdgeInsets.all(10),
                       hintText: 'second last',
                     ),
                     validator: (value) {
                       if(value!.isEmpty){
                         return "Enter correct name";
                       }else{
                         return null;
                       }
                     },
                   ),
                   ),
                 ],
               ),
               const SizedBox(
                 height: 10,
               ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                   color: Colors.black
                   ),
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email_outlined),
                  isDense: false,
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'example@email.com'
                   ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter correct name";
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                  height: 10,
                  ),
                  TextFormField(
                    controller: pass,
                      obscureText: obs,
                      keyboardType: TextInputType.streetAddress,
                  style: const TextStyle(
                   color: Colors.black
                  ),
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    icon: Icon(Icons.lock_outline_rounded),
                    isDense: false,
                    contentPadding: EdgeInsets.all(10),
                  hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obs == true ? obs = false : obs = true;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined)),
                  ),
                  validator: (value) {
                      if(value!.isEmpty){
                        return "Enter correct name";
                      }else{
                        return null;
                      }
                    },
                  ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: datebirth,
                 keyboardType: TextInputType.datetime,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.calendar_month_outlined),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'Fecha de nacimiento',
                   helperText: "DD/MM/AAAA",
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: genero,
                 keyboardType: TextInputType.streetAddress,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.male),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'Genero',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: citybirth,
                 keyboardType: TextInputType.streetAddress,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.location_city_outlined),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'City of Birth',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: cityresidence,
                 keyboardType: TextInputType.streetAddress,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.location_city_outlined),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'city of residence',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: nationality,
                 keyboardType: TextInputType.streetAddress,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.flag),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'nationality',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
               const SizedBox(
                 height: 10,
               ),
               TextFormField(
                 controller: numberphone,
                   keyboardType: TextInputType.phone,
                 style: const TextStyle(
                     color: Colors.black
                 ),
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   icon: Icon(Icons.phone_android_outlined),
                   isDense: false,
                   contentPadding: EdgeInsets.all(10),
                   hintText: 'Telefono celular',
                 ),
                 validator: (value) {
                   if(value!.isEmpty){
                     return "Enter correct name";
                   }else{
                     return null;
                   }
                 },
               ),
                  const SizedBox(
                      height: 25),
                  SizedBox(
                 width: double.infinity,
                 height: 50,
                 child: ElevatedButton(
                   style: const ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigoAccent),
                   ),
                   onPressed: () {
                          if (_Keyform.currentState!.validate()) {
                            RegisterUser();
                            ViewSnackBar("usuario creado correctamente", context);
                            _showTrips(context);
                          }else{
                            ViewSnackBar("Ha ocurrido un error, revise el formulario", context);
                          }
                   },
                   child: const Text("Registrar",
                     style: TextStyle(fontSize: 20),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
     ],
    ),
      ),
      ),
   );
 }
  @override
  void dispose() {
    username.dispose();
    firstname.dispose();
    secondname.dispose();
    firstlast.dispose();
    secondlast.dispose();
    email.dispose();
    pass.dispose();
    datebirth.dispose();
    genero.dispose();
    citybirth.dispose();
    cityresidence.dispose();
    nationality.dispose();
    numberphone.dispose();

    super.dispose();
  }
  void _showTrips(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed(
        '/trips');
  }


}