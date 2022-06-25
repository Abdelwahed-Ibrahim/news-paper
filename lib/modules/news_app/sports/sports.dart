import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/news_cubit/cubit/cubit.dart';
import '../../../shared/news_cubit/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return list.isNotEmpty
            ? articleBuilder(list)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
