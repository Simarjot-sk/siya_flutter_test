import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/data/constants.dart';
import 'package:simar_test/data/models/categories.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/data/news_repository.dart';
import 'package:simar_test/presentation/details/details_screen.dart';
import 'package:simar_test/presentation/discover/discover_state_holder.dart';
import 'package:simar_test/presentation/discover/widgets/category_radio.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:simar_test/presentation/home/widgets/top_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final PagingController<int, NewsItemDto> _pagingController =
      PagingController(firstPageKey: 0);
  NewsCategory selectedCategory = NewsCategory.all;
  String _query = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await NewsRepository.getHeadlines(pageKey, selectedCategory, _query);
      final isLastPage = newItems.length < kPageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoverStateHolder>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const GrayContainer(icon: Icons.navigate_before),
            const SizedBox(height: 20),
            const Text(
              'Discover',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const Text(
              'News from all around the world',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            _buildSearchField(),
            const SizedBox(height: 16),
            SizedBox(
              height: 25,
              child: CategoryRadio(
                  selectedCategory: selectedCategory,
                  onCategoryClicked: (cat) {
                    setState(() {
                      selectedCategory = cat;
                      _pagingController.refresh();
                    });
                  }),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PagedListView<int, NewsItemDto>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<NewsItemDto>(
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailsScreen.route, arguments: item);
                    },
                    child: NewsListItem(
                      dto: item,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          hintText: 'Search',
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: const Icon(
            Icons.filter_list_outlined,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: _onChanged,
      ),
    );
  }

  ///in order to avoid calling api on every character entered.
  ///We will only call the api, once the user has stopped typing, 500 milliseconds have elapsed
  void _onChanged(String query) {
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 500),
      () {
        //call api from here
        _query = query;
        _pagingController.refresh();
      },
    );
  }
}
