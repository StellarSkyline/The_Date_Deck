import 'package:date_deck/feature/home/domain/FavoriteViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/CardFavoriteComponent.dart';
import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<FavoriteViewModel>();
    vm.getFavorites();

    return BlocBuilder<FavoriteViewModel, FavoriteState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: state.isEmpty
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state.favoriteList.isEmpty
                    ? EmptyHandler(textTitle: "Favorites is Empty")
                    : ListView.builder(
                        itemCount: state.favoriteList.length,
                        itemBuilder: (context, index) {
                          return CardFavoriteComponent(
                            name: state.favoriteList[index].name,
                            suit: state.favoriteList[index].suit,
                            categoryName: state.favoriteList[index].category.displayName,
                            effortValue: state.favoriteList[index].effortValue,
                            onPress: (value) => {
                              vm.deleteDate(state.favoriteList[index])
                            },
                          );
                        },
                      ),
              ),
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
