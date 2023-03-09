import 'package:coresolutions/pages/natures/bloc/natures_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NaturesPage extends StatelessWidget {
  const NaturesPage({super.key});

  static const String route = "natures-page";

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Natures"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Show Snackbar',
              onPressed: () {
                // Navigator.pushNamed(context, AddNaturePage.route);
              },
            ),
          ],
        ),
        body: BlocBuilder<NaturesBloc, NaturesState>(
          // bloc: BlocProvider.of<NaturesBloc>(context)..add(event),
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              // child: ListView.separated(
              //     separatorBuilder: (ctx, i) => const Divider(
              //           endIndent: 15,
              //           indent: 15,
              //           height: 1,
              //           color: Colors.grey,
              //         ),
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: itemBuilder,
              //     itemCount: itemCount),
            );
          },
        ),
      ),
    );
  }
}
