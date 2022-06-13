import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/feature/domain/entities/person_entity.dart';
import 'package:udemy/feature/presentation/block/person_list_cuit/person_list_cuit.dart';
import 'package:udemy/feature/presentation/block/person_list_cuit/person_list_state.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text(''),);
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      }
      return ListView.separated(itemBuilder: (context, index) {
        return Text(persons[index].name);
      }, separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400]
        );
      }, itemCount: persons.length);
    });
  }

  Widget _loadingIndicator() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
