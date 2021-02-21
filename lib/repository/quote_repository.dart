import 'package:QuotzApp/models/quote_model.dart';
import 'package:QuotzApp/services/quote_services.dart';

class QuoteRepository {
  QuoteServices _quoteServices = QuoteServices();

  Future<List<QuoteModel>> getQuote() async {
    final quotes = await _quoteServices.getQuotes();
    return quotes;
  }
}
