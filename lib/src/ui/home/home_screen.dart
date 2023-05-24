import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neonatos/src/widgets/buttons/custom_elevated_button.dart';
import 'package:neonatos/src/widgets/images/custom_image.dart';
import 'package:neonatos/src/widgets/loading_logo.dart';

import '../../theme/colors.dart';
import '../../theme/inputs/style_text_field.dart';
import '../../utils/lang/type_validator.dart';
import '../../widgets/modals/custom_botton_modal.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController medicamentoController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  bool loading = false;

  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    medicamentoController.dispose();
    textEditingController.dispose();
    homeBloc.close();
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
                BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    builder: (context, state) {
                      if (state is CalculateState) {
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              for (String item in state.result.split(' '))
                                TextSpan(
                                  text: ValidatorText.onlyLettersWithBold
                                          .hasMatch(item)
                                      ? '${item.replaceAll('*', '')} '
                                      : '$item ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: ValidatorText.onlyLettersWithBold
                                                .hasMatch(item)
                                            ? AppColors.primaryColor
                                            : AppColors.textColor,
                                        fontWeight: ValidatorText
                                                .onlyLettersWithBold
                                                .hasMatch(item)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                ),
                            ],
                          ),
                        );
                      }
                      return Text(
                        'Ingresa el peso del bebé, para calcular su dosis de medicamento, según su peso',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      );
                    }),
                const SizedBox(height: 20.0),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: StyleTextField.style(context),
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        controller: medicamentoController,
                        decoration: StyleTextField.inputDecoration(
                          context,
                          labelText: 'Seleccione el medicamento',
                          hintText: 'Seleccione el medicamento',
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ),
                        onTap: () {
                          _modal(context);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El peso es requerido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              textEditingController.clear();
                              homeBloc.add(HomeInitialEvent());
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          homeBloc.add(
                            CalculateEvent(
                              double.parse(value!),
                            ),
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El peso es requerido';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (context, state) {
                    return Row(
                      children: [
                        CustomElevatedButton(
                          text: state is CalculateState
                              ? 'Volver a calcular'
                              : 'Calcular',
                          expaned: true,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                          },
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );

  void _modal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => CustomButtomModal(
              widget: Column(
                children: List.generate(
                  homeBloc.medicina.length,
                  (index) => ListTile(
                    title: Text(
                      homeBloc.medicina.elementAt(index).description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    selected: homeBloc.selectMedicine.type ==
                            homeBloc.medicina.elementAt(index).type
                        ? true
                        : false,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context, false);
                        homeBloc.add(
                          ChangeMedicineEvent(
                            homeBloc.medicina.elementAt(index),
                          ),
                        );
                        medicamentoController.text =
                            homeBloc.medicina.elementAt(index).description;
                        textEditingController.clear();
                      });
                    },
                  ),
                ),
              ),
            ));
  }
}
