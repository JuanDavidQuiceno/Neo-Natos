import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neonatos/src/widgets/buttons/custom_elevated_button.dart';
import 'package:neonatos/src/widgets/images/custom_image.dart';
import 'package:neonatos/src/widgets/loading_logo.dart';

import '../../theme/inputs/style_text_field.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  bool loading = false;
  bool calulate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: _content(context, screenSize),
        ),
        if (loading) const LoadingLogo(),
      ],
    );
  }

  Widget _content(BuildContext context, Size screenSize) => Container(
        height: screenSize.height,
        width: screenSize.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomImage(
                  image: 'assets/happy-baby-cuate.svg',
                  height: 200,
                ),
                const SizedBox(height: 20.0),
                Text(
                  calulate
                      ? 'La dosis de medicamento, según el peso del bebé es: #######'
                      : 'Ingresa el peso del bebé, para calcular su dosis de medicamento, según su peso',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Form(
                  key: formKey,
                  child: TextFormField(
                    style: StyleTextField.style(context),
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    inputFormatters: [
                      // expersion regular para numero con un punto
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: StyleTextField.inputDecoration(
                      context,
                      labelText: 'Peso del bebé',
                      hintText: 'ingresa el peso del bebé',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'El peso es requerido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  children: [
                    CustomElevatedButton(
                      text: calulate ? 'Volver a cacular' : 'Calcular',
                      expaned: true,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            if (calulate) {
                              calulate = false;
                              textEditingController.clear();
                            } else {
                              calulate = true;
                            }
                          }).then((value) {
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
