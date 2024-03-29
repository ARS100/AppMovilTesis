import 'package:agrotech/features/3.opciones_supervisor/presentation/2.2.gestion_egresos/gestion_egresos_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/asignacion_cultivos_page.dart';
import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/gestion_ingresos_page.dart';
import 'package:agrotech/features/2.home/presentation/widgets/informes_options_widget.dart';
import 'package:flutter/material.dart';

class SupervisorOptions extends StatelessWidget {
  const SupervisorOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubtitleWidget('Gestion productiva:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              MiniOptionWidget(
                title: 'Asignar cultivos',
                iconRoute: 'assets/cultivation.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AsigCultivoPage()),
                  );
                },
              ),
            ],
          ),
        ),
        const SubtitleWidget('Gestion financiera:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              MiniOptionWidget(
                title: 'Gestion ingresos',
                iconRoute: 'assets/contract.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GestionIngresos()),
                  );
                },
              ),
              MiniOptionWidget(
                title: 'Gestion egresos',
                iconRoute: 'assets/egreso.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GestionEgresos()),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const InformesOptions(),
      ],
    );
  }
}
