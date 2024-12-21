part of 'catalogue_bloc.dart';

abstract class CatalogueState extends Equatable {
  const CatalogueState();

  @override
  List<Object> get props => [];
}

class CatalogueInitial extends CatalogueState {}

class CatalogueLoading extends CatalogueState {}

class CatalogueLoaded extends CatalogueState {
  final CatalogueEntity catalogue;

  const CatalogueLoaded({required this.catalogue});
}

class CatalogueError extends CatalogueState {
  final String error;

  const CatalogueError({required this.error});
}
