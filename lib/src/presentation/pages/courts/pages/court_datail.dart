import 'package:agenda_canchas_app/src/data/a/court_model.dart';
import 'package:agenda_canchas_app/src/presentation/pages/courts/bloc/court_bloc.dart';
import 'package:agenda_canchas_app/src/presentation/pages/myApp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class CourtDetailPage extends StatelessWidget {
  final String id;
  const CourtDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourtBloc(),
      child: CourtDetailBody(
        id: id,
      ),
    );
  }
}

class CourtDetailBody extends StatefulWidget {
  final String id;
  const CourtDetailBody({super.key, required this.id});

  @override
  State<CourtDetailBody> createState() => _CourtDetailBodyState();
}

class _CourtDetailBodyState extends State<CourtDetailBody> {
  CourtElement? courtModel;
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (courtModel == null) {
      BlocProvider.of<CourtBloc>(context)
          .add(OnCourtDetail(courtId: widget.id));
    }
    return BlocConsumer<CourtBloc, CourtState>(
      listener: blocListener,
      builder: (context, state) {
        return renderUI(state);
      },
    );
  }

  void blocListener(BuildContext context, CourtState state) {
    if (state is CourtDetailSuccess) {
      courtModel = state.getCourt();
    }
    if (state is CourtLoading) {}
    if (state is CourtFail) {}
  }

  Widget renderUI(CourtState state) {
    BlocProvider.of<CourtBloc>(context).add(OnCourtDetail(courtId: widget.id));
    if (state is CourtDetailSuccess) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("name"),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(),
                  image: DecorationImage(
                      image: AssetImage(courtModel?.img ?? ""),
                      fit: BoxFit.cover)),
              width: double.infinity,
              height: 100,
            ),
            const Divider(
              thickness: 2,
            ),
            Text("Cancha ${courtModel?.name ?? ""}"),
            Container(
              padding: const EdgeInsets.only(
                right: 5,
                left: 5,
              ),
              width: double.infinity,
              height: 150,
              child: Text(courtModel?.description ?? ""),
            ),
            WeeklyDatePicker(
              enableWeeknumberText: false,
              selectedDay: _selectedDay, // DateTime
              changeDay: (value) => setState(() {
                _selectedDay = value;
              }),
            ),
            ElevatedButton(
                onPressed: () {
                  if (courtModel != null) {
                    BlocProvider.of<CourtBloc>(context).add(
                      OnsaveCourtDate(
                        nameCourt: courtModel!.name!,
                        date: _selectedDay.toString(),
                        name: "userName",
                        available: courtModel!.available!,
                        img: courtModel!.img!
                      ),
                    );
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAppPage(),
                    ),
                  );
                },
                child: const Text("Agendar"))
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
