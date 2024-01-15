import 'package:agenda_canchas_app/src/data/a/court_model.dart';
import 'package:agenda_canchas_app/src/presentation/pages/courts/bloc/court_bloc.dart';
import 'package:agenda_canchas_app/src/presentation/pages/courts/pages/court_datail.dart';
import 'package:agenda_canchas_app/src/presentation/widgets/card_court_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourtsPage extends StatelessWidget {
  const CourtsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourtBloc>(
      create: (context) => CourtBloc(),
      child: const CourtsBody(),
    );
  }
}

class CourtsBody extends StatefulWidget {
  const CourtsBody({Key? key}) : super(key: key);

  @override
  State<CourtsBody> createState() => _CourtsBodyState();
}

class _CourtsBodyState extends State<CourtsBody> {
  late CourtModel courtsModel;

  @override
  void initState() {
    BlocProvider.of<CourtBloc>(context).add(OnCourtSuccess());
    super.initState();
  }

   Future<void> onRefresh() async {
    BlocProvider.of<CourtBloc>(context).add(OnCourtSuccess());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourtBloc, CourtState>(
      listener: (context, state) {
        blocListener(context, state);
      },
      builder: (context, state) {
        return renderUI(state);
      },
    );
  }

  void blocListener(BuildContext context, CourtState state) {
    if (state is CourtSuccess) {
      courtsModel = state.getCourts();
    }
    if (state is CourtLoading) {
     
    }
    if (state is CourtFail) {
    }
    if (state is CourtNavigateToDetail) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourtDetailPage(id: state.courtId),
        ),
      );
    }
  }

  Widget renderUI(CourtState state) {
    if (state is CourtSuccess) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh:onRefresh ,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Wrap(
                  spacing: 10,
                  runSpacing:
                      10, 
                  children: courtsModel.courts!.map((court) {
                    return CardCourtWidget(
                      name: court.name ?? "",
                      image: court.img ?? "",
                      data:'Disponibles',
                      onTap: () {
                        BlocProvider.of<CourtBloc>(context)
                            .add(OnCourtDetail(courtId: court.id!));
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return const Center( child: CircularProgressIndicator(),);
  }
}
