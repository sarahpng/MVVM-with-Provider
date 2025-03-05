import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/data/response/status.dart';
import 'package:mvvm_with_provider/model/movies_model.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view_model/home_view_model.dart';
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
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // in case we want our provider to build on run time instead of putting it in main
    // we can do this
    homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.login, (route) => false);
              });
            },
            child: Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, provider, child) {
          switch (provider.moviesList.status) {
            case Status.LOADING:
              return CircularProgressIndicator(
                color: Colors.grey,
              );
            case Status.ERROR:
              return Text(provider.moviesList.message.toString());
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: provider.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          provider.moviesList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stack) {
                            return Icon(Icons.error);
                          },
                        ),
                        title: Text(
                          provider.moviesList.data!.movies![index].title
                              .toString(),
                        ),
                        subtitle: Text(
                          provider.moviesList.data!.movies![index].year
                              .toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(''),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
