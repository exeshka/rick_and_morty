import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/presentation/bloc/bloc/person_bloc.dart';
import 'package:rick_and_morty/features/presentation/widgets/card_person.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonEntity?> personList = [];

  int currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<PersonBloc>(context).add(GetPersons(page: 1));
  }

  void updatePersonList() {
    setState(() {
      personList.addAll(personList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is PersonSuccess) {
          return LazyLoadScrollView(
              onEndOfPage: () {
                BlocProvider.of<PersonBloc>(context)
                    .add(GetPersons(page: currentPage));

                setState(() {
                  currentPage + 1;
                });
              },
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.persons.length,
                itemBuilder: (context, index) {
                  PersonEntity? person = state.persons[index];

                  return CardPerson(
                    person: person!,
                  );
                },
              ));
        }

        if (state is PersonLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PersonError) {
          return Center(child: Text(state.error));
        }

        return Center(child: Text("Начни поиск персонажей"));
      },
    ));
  }
}
