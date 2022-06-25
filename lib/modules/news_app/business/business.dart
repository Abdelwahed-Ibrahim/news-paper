import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/shared/components/components.dart';

import '../../../shared/news_cubit/cubit/cubit.dart';
import '../../../shared/news_cubit/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return list.isNotEmpty
            ? articleBuilder(list)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
