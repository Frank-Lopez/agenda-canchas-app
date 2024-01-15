import 'package:agenda_canchas_app/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Map<String, dynamic>? court;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(OnHomeSuccess());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: blocListener,
      builder: (context, state) {
        return renderUI(state);
      },
    );
  }

  void blocListener(BuildContext context, HomeState state) {
    if (state is HomeSuccess) {
      court = state.getDateSave();
    }
    if (state is HomeLoading) {}
  }

  Widget renderUI(HomeState state) {
    if (state is HomeSuccess) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: court!.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(
                              "La cancha reservada es la ${court!["namecourt"]}",
                            ),
                            subtitle: Text(" ${court!["date"]}"),
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      );
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.find_in_page_rounded),
          Text("No hay datos registrados aun")
        ],
      ),
    );
  }
}
