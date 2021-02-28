import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/weather.dart';
import 'package:providers/view_models/old_searchs_model.dart';
import 'package:providers/view_models/weather_view_model.dart';
import 'package:providers/widget/simple_dialog_widget.dart';

class SavedCityWidget extends StatefulWidget {
  @override
  _SavedCityWidgetState createState() => _SavedCityWidgetState();
}

class _SavedCityWidgetState extends State<SavedCityWidget> {
  List<List<String>> cityList = [];

  @override
  Widget build(BuildContext context) {
    cityList = Provider.of<OldSearchModel>(context).getAllCityFromSf();
    return cityList.length == 0
        ? Container(
            child: IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ListenableProvider<WeatherViewModel>(
                        create: (_) => WeatherViewModel(),
                      ),
                      ListenableProvider<OldSearchModel>(
                        create: (_) => OldSearchModel(),
                      ),
                    ],
                    child: SimpleDialogWidget(cityList),
                  ),
                ),
              );
            },
          ))
        : ListView.builder(
            itemCount: cityList.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cityList[index][0],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                trailing: Icon(Icons.ac_unit_sharp),
                backgroundColor: Colors.teal.shade300,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.cancel_presentation_sharp,
                            color: Colors.black,
                          ),
                          onPressed: null),
                      Column(
                        children: [
                          Text(
                            cityList[index][1],
                          ),
                          Text(
                            cityList[index][2],
                          ),
                          Text(
                            cityList[index][3],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
  }
}
/*ListView(
      children: [
        
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 72,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        IconButton(icon: Icon(Icons.add,size: 32,color: Colors.grey.shade500,), onPressed: (){})
      ],
    ) */
