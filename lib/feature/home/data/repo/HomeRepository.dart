
import 'package:flutter/cupertino.dart';
import '../../core/database/database.dart';
import '../model/date.dart';
import '../../core/database/date_dao.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class HomeRepository {

    Future<DateDao> buildDatabase() async {
        WidgetsFlutterBinding.ensureInitialized();
        final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();

        final dateDao = database.dateDao;

        final String response = await rootBundle.loadString('assets/json/date_idea_database.json');

        final data = (jsonDecode(response) as List)
            .cast<Map<String, dynamic>>();


        data.map<Date>((json) => Date.fromJson(json)).toList().forEach((element) async {
            dateDao.findDateById(element.id).then((value) async {
                if(value == null) {
                    await dateDao.insertDate(element);
                }
                },
            );
        });


        return dateDao;

    }

}
