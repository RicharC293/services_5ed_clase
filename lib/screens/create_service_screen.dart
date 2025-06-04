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
  String _direccion = '';
  DateTime _date = DateTime.now();
  String? _message;
  bool _acceptaTerminos = false;

  late TextEditingController _dateTimeController;

  @override
  void initState() {
    print("INIT_STATE");
    _dateTimeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    print("DISPOSE");
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
      appBar: AppBar(title: Text("Crear Servicio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Dirección",
                    hintText: "Ingresa tu dirección",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu dirección';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _direccion = value ?? '';
                  },
                ),
                TextFormField(
                  controller: _dateTimeController,
                  decoration: InputDecoration(
                    labelText: "Fecha y Hora",
                    hintText: "Selecciona la fecha y hora",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor selecciona una fecha y hora';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _date = DateTime.tryParse(value!) ?? DateTime.now();
                  },
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2200),
                      initialDate: DateTime.now(),
                      selectableDayPredicate: (day) {
                        // Permite bloquear los días por ejemplo un feriado nacional.
                        return day != DateTime(2025, 6, 13);
                      },
                    ).then((value) {
                      print("La fecha es: $value");
                      if (value == null) return;
                      if (!context.mounted) return;
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((time) {
                        print("La hora es: $time");
                        if (time == null) return;
                        final dateFinal = DateTime(
                          value.year,
                          value.month,
                          value.day,
                          time.hour,
                          time.minute,
                        );
                        print(dateFinal);
                        _dateTimeController.text = dateFinal.toString();
                      });
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mensaje",
                    hintText: "Escribe un mensaje (opcional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  maxLines: 5,
                  onSaved: (value) {
                    _message = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: const Text(
                        "Al crear un servicio, aceptas nuestros términos y condiciones.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    Checkbox(
                      value: _acceptaTerminos,
                      onChanged: (value) {
                        _acceptaTerminos = value ?? false;
                        setState(() {});
                      },
                    ),
                  ],
                ),

                // Radio(
                //   groupValue: "Test",
                //   value: "Test",
                //   onChanged: (value){},
                // ),
              ],
            ),
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
            if (isValid) {
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
