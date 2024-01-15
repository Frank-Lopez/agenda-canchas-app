import 'package:agenda_canchas_app/src/presentation/pages/courts/pages/courts_page.dart';
import 'package:agenda_canchas_app/src/presentation/pages/home/pages/home_page.dart';
import 'package:agenda_canchas_app/src/presentation/pages/myApp/bloc/my_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAppBloc>(
      create: (context) => MyAppBloc(),
      child: const MyAppBody(),
    );
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  _MyAppBodyState createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {

    @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAppBloc, MyAppState>(
      listener: (_,__){},
      builder: (context, state) {
        return renderUI(state);
      },
    );
  }


  Widget renderUI(MyAppState state) {
    if(state is PageChangedState){

    return Scaffold(
      appBar: AppBar(title: state.currentIndex == 0
                  ? const Text("Home")
                  : const Text("Canchas"),),
      body: IndexedStack(
        index: state.currentIndex,
        children: const [
          HomePage(),
          CourtsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:state is PageChangedState ? state.currentIndex : 0,
        onTap: (index) {
          setState(() {
            context.read<MyAppBloc>().add(OnChangePageEvent(index));
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: "Canchas"),
        ],
      ),
    );

    }
    return const Center(child: CircularProgressIndicator(),);
  }
}
