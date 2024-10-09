part of 'catalogue_bloc.dart';

abstract class CatalogueState extends Equatable {
  const CatalogueState();  

  @override
  List<Object> get props => [];
}
class CatalogueInitial extends CatalogueState {}
