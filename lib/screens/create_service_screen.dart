import 'package:flutter/material.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key});

  static const String routeName = "/create-service";

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nombreApellido = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear Servicio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nombre y Apellido",
                  hintText: "Ingresa tu nombre y apellido",
                  prefixIcon: Icon(Icons.people_alt),
                  // suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                // Cada vez que hacemos un cambio en el input
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  /// Validación que es requerido
                  if (value == null || value.isEmpty) {
                    return "Este campo es requerido";
                  }
                  // Aquí está todos los validadores que se necesiten.
                  // Validar si es un email
                  // Validar si solo tiene números
                  // Validar si solo tiene letras
                  // Validar si la longitud del texto es 10 dígitos
                  return null;
                },
                onSaved: (value) {
                  _nombreApellido = value ?? '';
                },
                // Solo nos permite en el TextField
                // onSubmitted: (value) {
                //   print("On sub: $value");
                // },
              ),
              // Radio(
              //   groupValue: "Test",
              //   value: "Test",
              //   onChanged: (value){},
              // ),
              // Checkbox(value: null, onChanged: (value){},tristate: true,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            //1. Validar el formulario
            final isValid = _formKey.currentState!.validate();
            print("IS_VALID: $isValid");
            if(isValid) {
              _formKey.currentState!.save();
              /// Enviar el request o hacer una petición
              print("El nombre y apellido es: $_nombreApellido");
            }
            //2. Si el formulario es válido voy a imprimir los valores
          },
          child: Text("Crear Servicio"),
        ),
      ),
    );
  }
}
