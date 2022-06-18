import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_app/events_model.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath).then((file) => file.toString());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _chosenValue = 'USD Dollar';

  List<String>? currencies = [
    'USD Dollar',
    'RUB Rubel',
    'KZT Tenge',
    'GBP Sterling Pound',
    'EUR Euro',
    'JPY Japanese Yen'
  ];

  List<String>? options = [
    'All',
    'All 2',
    'All 3',
    'All 4',
    'All 5',
    'All 6'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.launch),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [

            // USA flag
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/usa_flag.webp'),
            ),

            // USD Account + Hide Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container()
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: const Text(
                        'USD Account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        ),
                      )
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          primary: Colors.black,
                          side: BorderSide(
                            width: 1,
                            color: Colors.white,
                            style: BorderStyle.solid
                          )
                        ),
                        onPressed: () {},
                        child: const Text('Hide'),
                      ),
                    ),
                  )
                ),
              ],
            ),

            // Cash
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '\$ 180,970.83',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26
                )
              ),
            ),

            // Transaction history
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                color: Color(0xFF393635), // TODO: Play with last digit
                width: double.infinity,
                child: Column(
                  children: [

                    // Transaction History
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 25,
                        // bottom: 15
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Transactions History',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),

                    // Currencies
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            underline: SizedBox(),
                            isExpanded: true,
                            dropdownColor: Colors.blueGrey[900],
                            value: _chosenValue,
                            items: currencies?.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.white),)
                            );
                          }).toList(),
                              onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value ?? 'value';
                              });
                          }),
                        ),
                      ),
                    ),

                    // All Option + Calendar
                    Padding(
                      padding: EdgeInsets.only(
                        right: 10,
                        bottom: 20
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: DropdownButton(
                                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                                      iconEnabledColor: Colors.white,
                                      iconDisabledColor: Colors.white,
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      dropdownColor: Colors.blueGrey[900],
                                      value: _chosenValue,
                                      items: currencies?.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value, style: TextStyle(color: Colors.white),)
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _chosenValue = value ?? 'value';
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 1
                              )
                            ),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // ListView.builder
            FutureBuilder(
              future: fetchFileFromAssets('assets/json/events.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var events = EventsModel.fromJson(json.decode(snapshot.data as String));
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: events.date?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          // Yesterday event
                          Container(
                            color: Colors.grey,
                            height: 50,
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10
                                ),
                                child: Text(
                                  '${events.date?[index].name}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),

                            // Yesterday sub event
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: events.date?[index].names?.length ?? 0,
                            itemBuilder: (context, index2) {
                              return Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset(
                                      '${events.date?[index].icons?[index2]}'
                                    )
                                  ),
                                  title: Text('${events.date?[index].names?[index2]}'),
                                  subtitle: Text('12:33'),
                                  trailing: Text('${events.date?[index].cashes?[index2]}'),
                                ),
                              );
                            }
                          )
                          ],
                        );
                      }
                  );
                } else if (snapshot.hasError) {
                  return Text('Error in Future Builder');
                }
                return Text('Another Error in Future Builder');
              }
            )
          ],
        ),
      ),
    );
  }
}
