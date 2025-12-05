import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    vm.saveDate();
    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Color(0xFFF4F4F4)),
          backgroundColor: Color(0xFFF4F4F4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: vm.saveDate(),
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return (Align(
                      alignment: Alignment.center,
                      child: Container(width: 100, height: 100, child: CircularProgressIndicator()),
                    ));
                  } else {
                    if (data.data == true) {
                      return EmptyHandler(textTitle: 'Date Idea successfully saved to server');
                    } else {
                      return EmptyHandler(textTitle: 'Date Idea was not saved to server');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
