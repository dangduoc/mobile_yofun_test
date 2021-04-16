import 'package:flutter/material.dart';

class PageHeaderWithSearchWidget extends StatelessWidget {
  final String title;
  const PageHeaderWithSearchWidget({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      floating: true,
      elevation: 0,
      title: Text(
        this.title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: -1.2,
        ),
      ),
      centerTitle: false,
    );
  }
}
