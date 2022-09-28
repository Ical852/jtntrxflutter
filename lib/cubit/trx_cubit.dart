import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jtntrx/models/trxdatamodel.dart';
import 'package:jtntrx/services/allservice.dart';

part 'trx_state.dart';

class TrxCubit extends Cubit<TrxState> {
  TrxCubit() : super(TrxInitial());

  void getTrx(cookie) async {
    emit(TrxLoading());
    TrxDataModel trx = await AllService().getTrx(cookie);
    emit(TrxSuccess(trx));
  }
}
