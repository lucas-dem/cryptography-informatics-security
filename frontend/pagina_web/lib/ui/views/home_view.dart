

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        const Text('TecnoSolutions', style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text('Ingrese para cambiar sus credenciales', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400)),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            width: 400,
            height: 50,
            decoration: buildDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                      onFieldSubmitted: (value) => setState(() {}),
                      onChanged: (value) => setState(() {}),
                      validator: ( value ) {
                        if (value == null ) return 'Ingrese su usuario';
                        return null;
                      } ,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.verified_user_outlined,
                          color: Colors.white,
                        ),
                        labelText: 'Usuario',
                        helperText: 'Ingrese su usuario',
                        labelStyle: TextStyle(color: Colors.white),
                        helperStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(height: 30),
                  TextFormField(
                    onFieldSubmitted: (value) => setState(() {}),
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if(value == null) {
                        return 'Ingrese su contraseña';
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password_outlined,
                          color: Colors.white),
                      labelText: 'Contraseña',
                      helperText: 'Ingrese su contraseña',
                      labelStyle: TextStyle(color: Colors.white),
                      helperStyle: TextStyle(color: Colors.white),
                      
                    )
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: buildBoxDecoration(),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            var dialog = const AlertDialog(
                              insetPadding: EdgeInsets.symmetric(horizontal: 200, vertical: 200),
                              title: Row(
                                children: [
                                  Icon(Icons.warning_outlined, color: Colors.red, size: 70),
                                  SizedBox(width: 20),
                                  Center(child: Text('ATAQUE FALSO!', style: TextStyle(fontSize: 70, color: Colors.black, fontWeight: FontWeight.bold),),),
                                  SizedBox(width: 20),
                                  CloseButton()
                                ],
                              ),
                              content: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Text('Esto fue un ejercicio de concientización \nsobre ataques de phishing. Ninguna información \nreal fue comprometida.', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.only(left: 80, right: 80),
                                    child: Text('Más cuidado la próxima vez!',style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
                                  )
                                ],
                              ),
                            );
                            showDialog(barrierDismissible: false, context: context, builder: (_)=>dialog);
                          },
                          child: const Text('Ingresar', style: TextStyle(color: Colors.black))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
        ),
        const SizedBox(height: 50)
      ],
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
    border: Border.all(color: Colors.white, width: 3),
    image: const DecorationImage(image: AssetImage('lib/assets/images/fondo-azul.jpg'), fit: BoxFit.cover)
  );

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.white, width: 3)
    );
  }
}