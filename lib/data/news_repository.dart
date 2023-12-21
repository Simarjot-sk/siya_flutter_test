import 'dart:convert';
import 'package:simar_test/data/constants.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  static Future<List<NewsItemDto>> getAllNews(int page, [String searchQuery = 'technology']) async {
    final queryParams = <String, String>{
      'pageSize': kPageSize.toString(),
      'page': page.toString(),
      'apiKey': '1ff96a9d46e04f5b85e3e0852ab61d73',
      'q': searchQuery
    };
    final uri = Uri.https(kBaseUrl, '/v2/everything', queryParams);
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      final status = resJson['status'];
      if (status == 'ok') {
        final articles = resJson['articles'] as Iterable;
        final articlesParsed = articles.map((e) => NewsItemDto.fromJson(e));
        return articlesParsed.toList();
      } else {
        final message = resJson['message'];
        throw NewsApiException(message.toString());
      }
    } else {
      throw NewsApiException("Something went wrong");
    }
  }
}

class NewsApiException extends Error {
  final String message;

  NewsApiException(this.message);
}
