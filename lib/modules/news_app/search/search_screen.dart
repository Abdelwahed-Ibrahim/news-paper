import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/shared/components/components.dart';

import '../../../shared/news_cubit/cubit/cubit.dart';
import '../../../shared/news_cubit/cubit/states.dart';

var searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                    context: context,
                    controller: searchController,
                    prefixIcon: Icons.search,
                    hint: 'Search',
                    isAutoFocus: true,
                    onChange: (value) {
                      // ToDo : search on each value when changed
                      NewsCubit.get(context).getSearch(value);
                    },
                  ),
                ),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: articleBuilder(list),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
