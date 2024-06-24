import 'package:flutter/material.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key,required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SearchBar(
        surfaceTintColor: WidgetStateProperty.all(const Color(0xffF8EBEB)),
        shadowColor: WidgetStateProperty.all(Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        trailing: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },

          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
            },

          ),
        ],
      ),
    );
  }
}
