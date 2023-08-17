import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import '../../domain/models/medidas_model.dart';
import 'my_buttom.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditMedida extends StatefulWidget {
  void Function(Medidas)? onSave;
  VoidCallback? onCancel;
  Medidas? initialMedida;

  final TextEditingController valueController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController metodoController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  String? selectedValue;

  EditMedida(
      {super.key, this.onSave, this.onCancel, required this.initialMedida}) {
    valueController.text = '${initialMedida?.value}';
    descripcionController.text = initialMedida?.description ?? '';
    unitController.text = initialMedida?.unit ?? '';
  }

  @override
  _editMedidaState createState() => _editMedidaState();
}

class _editMedidaState extends State<EditMedida> {
  String? selectedValue;
  int intValue = 0;
  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita la medida"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: widget.valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Valor de la medida"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  intValue = int.tryParse(text) ?? 0;
                });
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.descripcionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Descripcion "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                fecha = showDatePicker(
                  context: context,
                  initialDate: widget.initialMedida!.date as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialMedida!.date = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se tomó la medida:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // Puedes personalizar el color del borde aquí
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: InputBorder
                            .none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.initialMedida!.date!.day} / ${widget.initialMedida!.date!.month} / ${widget.initialMedida!.date!.year}',
                          style: TextStyle(
                            color: colors
                                .black, // Puedes personalizar el color del texto aquí
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: widget.unitController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Unidad"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      Medidas nuevaMedida = Medidas(
                          id: 0, // Asigna el ID adecuado
                          value: intValue,
                          description: widget.descripcionController.text,
                          date: widget.initialMedida!.date,
                          unit: widget.unitController.text);
                      widget.onSave!(nuevaMedida);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(
                    text: "Cerrar",
                    onPressed: widget.onCancel,
                    color: colors.white,
                    textColor: colors.textColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
