import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
// import 'package:mvvm_with_provider/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  });
                },
                child: Text('Home Screen')),
          ],
        ),
      ),
    );
  }
}
