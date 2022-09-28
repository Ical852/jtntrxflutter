part of 'trx_cubit.dart';

abstract class TrxState extends Equatable {
  const TrxState();

  @override
  List<Object> get props => [];
}

class TrxInitial extends TrxState {}

class TrxLoading extends TrxState {}

class TrxSuccess extends TrxState {
  TrxDataModel trxDataModel;
  TrxSuccess(this.trxDataModel);

  @override
  List<Object> get props => [trxDataModel];
}