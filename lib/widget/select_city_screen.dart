import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/old_searchs_model.dart';
import 'package:providers/view_models/weather_view_model.dart';
import 'package:providers/widget/saved_city_widget.dart';

class SelectCityScreen extends StatefulWidget {
  @override
  _SelectCityScreenState createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: TextFormField(
                        autofocus: true,
                        controller: _textController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: "Select city"),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pop(context, _textController.text);
                  },
                ),
              ],
            ),
            Expanded(
                child: MultiProvider(providers: [
              Provider<WeatherViewModel>(
                create: (_) => WeatherViewModel(),
              ),
              ListenableProvider<OldSearchModel>(
                create: (_) => OldSearchModel(),
              ),

            ],child: SavedCityWidget(),)),
          ],
        ),
      ),
    );
  }
}
/*ChangeNotifierProvider(
                create: (context) => OldSearchModel(),
                child: SavedCityWidget(),
              ), */
// Geçmişte aranan şehirlerin listesi Net ile bağlanacak.
