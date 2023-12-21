import 'package:flutter/cupertino.dart';
import 'package:simar_test/data/constants.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/data/news_repository.dart';
import 'package:simar_test/presentation/utils/action_state.dart';
import 'dart:developer' as dev;

class HomeStateHolder extends ChangeNotifier {
  ActionState<List<NewsItemDto>> loadBreakingNewsState = const LoadingState();
  ActionState<List<NewsItemDto>> loadRecommendationsState =
      const LoadingState();

  void loadBreakingNews() async {
    try {
      //updating action state to loading
      loadBreakingNewsState = const LoadingState();
      notifyListeners();

      final news = await NewsRepository.getAllNews(1);
      loadBreakingNewsState = SuccessState(news.take(5).toList());
      notifyListeners();
    } catch (e, stack) {
      final errorMessage =
          e is NewsApiException ? e.message : kGenericErrorMessage;
      loadBreakingNewsState = ErrorState(errorMessage);
      notifyListeners();
      dev.log('error while loading breaking news', error: e, stackTrace: stack);
    }
  }

  void loadRecommendations() async {
    try {
      //updating action state to loading
      loadRecommendationsState = const LoadingState();
      notifyListeners();

      final news = await NewsRepository.getAllNews(1, 'programming');
      loadRecommendationsState = SuccessState(news);
      notifyListeners();
    } catch (e, stack) {
      final errorMessage =
      e is NewsApiException ? e.message : kGenericErrorMessage;
      loadRecommendationsState = ErrorState(errorMessage);
      notifyListeners();
      dev.log('error while loading breaking news', error: e, stackTrace: stack);
    }
  }
}
