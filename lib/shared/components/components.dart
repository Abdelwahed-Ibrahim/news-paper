import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../modules/news_app/web_view/web_view_screen.dart';

String tempImage =
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/breaking-news-poster-design-template-1be272b346482cb733687b7348620211_screen.jpg?ts=1628825498';

ThemeData myTheme(bool isDark) => ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: isDark ? const Color(0xff333739) : Colors.white,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 20.0,
        color: isDark ? const Color(0xff333739) : Colors.white,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        elevation: 0.0,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: isDark ? const Color(0xff333739) : Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20.0,
        backgroundColor: isDark ? const Color(0xff333734) : Colors.white,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
      ),
    );

Widget buildArticleItem(BuildContext context, Map article) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage'] ?? tempImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(list) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(context, list[index]),
      separatorBuilder: (context, index) => mySeparator(),
      itemCount: list.length,
    );

Widget mySeparator() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 40.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required IconData prefixIcon,
  required String hint,
  required BuildContext context,
  bool isAutoFocus = false,
  bool isReadOnly = false,
  String? Function(String?)? validation,
  Function()? onTouch,
  Function(String)? onChange,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.normal),
        cursorColor: Colors.black,
        controller: controller,
        textAlign: TextAlign.center,
        readOnly: isReadOnly,
        autofocus: isAutoFocus,
        validator: validation,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onTap: onTouch,
        onChanged: onChange,
      ),
    );

void navigateTo(BuildContext context, Widget myNavigation) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => myNavigation,
      ),
    );
