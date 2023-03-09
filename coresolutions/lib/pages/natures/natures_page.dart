import 'package:coresolutions/pages/natures/bloc/natures_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NaturesPage extends StatelessWidget {
  const NaturesPage({super.key});

  static const String route = "natures-page";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NaturesBloc>(context).add(const GetNaturesEvent());
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: color.primary,
          title: Text(
            "Natures",
            style: TextStyle(color: color.onPrimary),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: color.onPrimary,
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                // Navigator.pushNamed(context, AddNaturePage.route);
              },
            ),
          ],
        ),
        body: BlocBuilder<NaturesBloc, NaturesState>(
          builder: (context, state) {
            if (state is GetNaturesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //TODO MOSTRAR ERROR
            if (state is GetNaturesErrorState) {
              return Center(
                child: Text(
                  state.errorMsg!,
                  style: TextStyle(color: color.error),
                ),
              );
            }
            if (state is GetNaturesLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ListView.separated(
                  separatorBuilder: (ctx, i) => const Divider(
                    endIndent: 0,
                    indent: 0,
                    height: 1,
                    color: Colors.grey,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.data.length,
                  itemBuilder: (((context, index) {
                    final nature = state.data[index];

                    return SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: "Código: ",
                                  style: text.bodyMedium!
                                      .copyWith(color: color.primary),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: nature.attributes.code,
                                      style: text.bodyMedium!.copyWith(
                                        color: color.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              nature.attributes.alias,
                              style: text.bodyMedium!.copyWith(
                                color: color.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
