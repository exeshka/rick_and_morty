import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/features/data/data_sources/remote/remoute_data_sourse.dart';
import 'package:rick_and_morty/features/data/repositories/person_repository_impl.dart';
import 'package:rick_and_morty/features/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/features/domain/usecases/get_persons_usecase.dart';
import 'package:rick_and_morty/features/presentation/bloc/bloc/person_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeContainer() async {
  // ИНСТАНСЫ

  initializeInstanse();

  // ИСТОЧНИКИ ДАННЫХ

  initializeDataSource();

  // РЕПОЗИТОРИИ

  initializeRepository();

  // USECASE

  initializeUseCase();

  // БЛОКИ

  initializeBloc();
}

void initializeInstanse() {
  sl.registerSingleton<Dio>(Dio());
}

void initializeDataSource() {
  sl.registerSingleton(RemouteDataSource(sl()));
}

void initializeRepository() {
  sl.registerSingleton<PersonRepository>(PersonRepositoryImpl(remote: sl()));
}

void initializeUseCase() {
  sl.registerSingleton<GetPersonsUseCase>(
      GetPersonsUseCase(personRepository: sl()));
}

void initializeBloc() {
  sl.registerSingleton<PersonBloc>(PersonBloc(sl()));
}
