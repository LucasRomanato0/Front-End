import 'package:consumir_api/src/models/moeda_model.dart';
import 'package:consumir_api/src/repositories/moeda_repository.dart';
import 'package:consumir_api/src/states/moeda_state.dart';
import 'package:flutter/material.dart';

class MoedaStore extends ValueNotifier<MoedaState> {
  final repository = MoedaRepository();

  MoedaStore() : super(MoedaState.init());

  Future<void> getMoedas() async {
    final moedas = await repository.getMoedas();

    value = value.copyWith(moedas: moedas);
  }

  Future<void> converter(String valorRaw) async {
    final cotacao = await repository.cotacao(value.moedaIn, value.moedaOut);

    final valor = double.parse(valorRaw);
    final result = valor * cotacao;

    value = value.copyWith(result: result.toStringAsFixed(2));
  }

  Future<void> selecionarMoedaIn(MoedaModel model) async {
    value = value.copyWith(moedaIn: model);
  }

  Future<void> selecionarMoedaOut(MoedaModel model) async {
    value = value.copyWith(moedaOut: model);
  }

  void switchMoedas() {
    value = value.copyWith(
      moedaIn: value.moedaOut,
      moedaOut: value.moedaIn,
    );
  }
}
