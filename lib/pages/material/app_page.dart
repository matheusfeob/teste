// import 'package:yandra_app/pages/material/services_list.dart';
import 'package:yandra_app/components/date_picker.dart';
// import 'package:yandra_app/pages/material/registry_profile.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:yandra_app/pages/material/registry_profile.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: RegistryProfile(),
    );
  }
}
