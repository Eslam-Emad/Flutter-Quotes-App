import 'dart:math';
import 'package:QuotzApp/models/quote_model.dart';
import 'package:QuotzApp/repository/quote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final quoteProvider = ChangeNotifierProvider<QuoteViewModel>((ref) => QuoteViewModel());

class QuoteViewModel extends ChangeNotifier {
  QuoteViewModel() {
    getQuotes();
  }

  QuoteRepository quoteRepository = QuoteRepository();
  bool loading = false;
  bool error = false;
  bool success = false;

  QuoteModel quote = QuoteModel(
    id: 0,
    author: "me",
    createdAt: null,
    quote: 'just enjoy good times. ',
  );

  get getQuote => quote;

  Future<void> getQuotes() async {
    loading = true;
    notifyListeners();
    try {
      final response = await quoteRepository.getQuote();
      int index = _generateRandomIndex(response.length + 1);
      print("index : $index");
      quote = response[index];
      notifyListeners();
      error = false;
      loading = false;
      notifyListeners();
    } catch (e) {
      error = true;
      loading = false;
      notifyListeners();
    }
  }

  int _generateRandomIndex(int x) {
    return Random().nextInt(x);
  }
}
