import 'package:coresolutions/pages/natures_create/natures_create_page.dart';
import 'package:coresolutions/pages/natures_list/bloc/natures_bloc.dart';
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
          title: Image.asset(
            "assets/coreinvent.png",
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: color.onPrimary,
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.pushNamed(context, NatureCreatePage.route);
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
                            flex: 3,
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
                            flex: 4,
                            child: Text(
                              nature.attributes.alias,
                              style: text.bodyMedium!.copyWith(
                                color: color.primary,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.important_devices_outlined,
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
