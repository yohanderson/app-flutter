import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LogInScreens extends StatefulWidget {
  const LogInScreens({super.key});


  @override
  State<StatefulWidget> createState() => _LogInScreens();
}

class _LogInScreens extends State<LogInScreens> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [
              SizedBox(height: 110),
              Center(
                child: Text("App flutter",
                textAlign: TextAlign.center,
                style: TextStyle (
                fontSize: 40,
                fontFamily: "Late",
                color: Colors.black,
                fontWeight: FontWeight.bold
                ),
                ),
              ),
              Center(
                child: Text("Login no se que",
                 style: TextStyle (
                     fontSize: 20,
                     fontFamily: "Late",
                     color: Colors.black,
                     fontWeight: FontWeight.normal
                 ),
               ),
              ),
               SizedBox(
                 height: 5,
               ),
               Datos(),
                  ],
                ),
              ),
      );
        }
 }

class Datos extends StatefulWidget{
  const Datos({super.key});

  @override
  State<StatefulWidget> createState() => _DatosState();
}

class _DatosState  extends State<Datos> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
           child: ListView(
           children: [
                    const Text('Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text('Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 7.5),
                    Row(
                    children: [
                      const Text('Recordarme',
                        style:
                        TextStyle(
                            color: Colors.black
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize:  16.5),
                      ),
                      onPressed: () { },
                      child: const Text('¿olvido su contraseña?',
                          style: TextStyle(color: Colors.indigoAccent)),
                    ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigoAccent),
                      ),
                      onPressed: () {
                        final String email = _emailController.text;
                        final String password = _passwordController.text;
                      },
                      child: const Text("Login",
                            style: TextStyle(fontSize: 16.8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          '¿No estas registrado?',
                          style: TextStyle(fontSize: 16.5, color: Colors.black),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize:  18.5),
                            ),
                            onPressed: () {
                              _showRegister(context);
                            },
                            child: const Text('Registrarse',
                              style: TextStyle(color: Colors.indigoAccent),)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                              icon: const Icon(FontAwesomeIcons.facebook,
                                color: Colors.black,
                                size: 35,
                              ),
                              onPressed: () { }
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.google,
                              color: Colors.black,
                              size: 35,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              icon: const Icon(FontAwesomeIcons.windows,
                                color: Colors.black,
                                size: 35,
                              ),
                              onPressed: () {  },)
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed(
        '/register');
  }
}