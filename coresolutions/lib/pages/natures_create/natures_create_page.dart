import 'package:coresolutions/UI/cs_textformfield.dart';
import 'package:coresolutions/pages/natures_create/bloc/nature_create_bloc.dart';
import 'package:coresolutions/pages/natures_list/natures_page.dart';
import 'package:coresolutions/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

class NatureCreatePage extends StatefulWidget {
  const NatureCreatePage({Key? key}) : super(key: key);

  static const String route = "natures-create-page";

  @override
  State<NatureCreatePage> createState() => _NatureCreatePageState();
}

class _NatureCreatePageState extends State<NatureCreatePage> {
  final TextEditingController _codeContoller = TextEditingController();

  final TextEditingController _aliasController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  onPressed(BuildContext context) {
    BlocProvider.of<NatureCreateBloc>(context).add(NatureCreateEvent(
      code: _codeContoller.text,
      alias: _aliasController.text,
      description: _descriptionController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;
    var responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: color.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: color.primary,
        title: Image.asset(
          "assets/coreinvent.png",
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.isWeb ? 450 : 600),
          child: BlocBuilder<NatureCreateBloc, NatureCreateState>(
              builder: (context, state) {
            if (state is NatureCreateInitial) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Crear naturaleza",
                      style: text.titleLarge!.copyWith(color: color.primary),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 5,
                              child: CSTextFormField(
                                controller: _codeContoller,
                                hint: "código",
                                error: false,
                                onPressed: () {
                                  _codeContoller.clear();
                                },
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 8,
                              child: CSTextFormField(
                                controller: _aliasController,
                                hint: "alias",
                                error: false,
                                onPressed: () {
                                  _aliasController.clear();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CSTextFormField(
                          controller: _descriptionController,
                          hint: "descripción",
                          error: false,
                          onPressed: () {
                            _descriptionController.clear();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          onPressed(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color.primary),
                        child: Text(
                          "Crear",
                          style: text.labelLarge!.copyWith(
                            color: color.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is NatureCreateLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NatureCreateLoadedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: "",
                  text: 'Creada correctamente',
                  confirmBtnColor: color.primary,
                  barrierColor: color.primary,
                  confirmBtnText: "ir al inicio",
                  onConfirmBtnTap: () {
                    BlocProvider.of<NatureCreateBloc>(context)
                        .add(const GoBackEvent());
                    Navigator.pushReplacementNamed(context, NaturesPage.route);
                  },
                );
              });
            }
            if (state is NatureCreateErrorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: "",
                  text: state.errorMsg,
                  confirmBtnColor: color.primary,
                  barrierColor: color.primary,
                  confirmBtnText: "ir al inicio",
                  onConfirmBtnTap: () {
                    BlocProvider.of<NatureCreateBloc>(context)
                        .add(const GoBackEvent());
                    Navigator.pushReplacementNamed(context, NaturesPage.route);
                  },
                );
              });
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
