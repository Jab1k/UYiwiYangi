import 'package:flutter/material.dart';
import 'package:flutter_application_8/pages/add_weather.dart';

import '../model/obhavo.dart';
import '../repasitories/rep.dart';
import '../weidget.dart/item.dart';

class WeathersHome extends StatefulWidget {
  final String name;
  WeathersHome({Key? key, this.name = 'Moscow'}) : super(key: key);
  @override
  State<WeathersHome> createState() => _WeathersHomeState();
}

class _WeathersHomeState extends State<WeathersHome> {
  Future<WeatherModel> getWeatherInfo() async {
    final data =
        await GetInformationRepository.getInformationWeather(name: widget.name);
    return WeatherModel.fromJson(data);
  }

  bool checkHour(int index, WeatherModel? snapshot) {
    return int.tryParse((snapshot
                    ?.forecast?.forecastday?.first.hour?[index].time ??
                "")
            .substring(
                (snapshot?.forecast?.forecastday?.first.hour?[index].time ?? "")
                        .indexOf(":") -
                    2,
                (snapshot?.forecast?.forecastday?.first.hour?[index].time ?? "")
                    .indexOf(":"))) ==
        TimeOfDay.now().hour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getWeatherInfo(),
        builder: (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Image.png'),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 130),
                            child: Center(
                              child: Text(
                                snapshot.data?.location?.name ?? "",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 34),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              (snapshot.data?.current?.tempC ?? 0)
                                  .toInt()
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 96),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  "Mostly Clear",
                                  style: TextStyle(
                                      color: Color(0xffAFB1CA),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              // Image.network(
                              //     "https:${snapshot.data?.current?.condition?.icon ?? ""}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "H:${snapshot.data?.forecast?.forecastday?.first.day?.maxtempC ?? 0}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Center(
                                    child: Text(
                                        "L:${snapshot.data?.forecast?.forecastday?.last.day?.maxtempC ?? 0}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),

                              Stack(
                                children: [
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Center(
                                      child: Image.asset(
                                          'assets/images/House.png')),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 200),
                                    child: Container(
                                      width: double.infinity,
                                      height: 333,
                                      decoration: const BoxDecoration(
                                          color: Color(
                                            0xff2E335A,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(44),
                                            topRight: Radius.circular(44),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 32,
                                                    top: 20,
                                                    right: 100),
                                                child: Text(
                                                  'Weekly Forecast',
                                                  style: TextStyle(
                                                      color: Color(0xffAFB1CA),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20),
                                                child: Text(
                                                  'Hourly Forecast',
                                                  style: TextStyle(
                                                      color: Color(0xffAFB1CA),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 200,
                                            child: ListView.builder(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 16),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: snapshot
                                                        .data
                                                        ?.forecast
                                                        ?.forecastday
                                                        ?.first
                                                        .hour
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  return HourItem(
                                                    isActive: checkHour(
                                                        index, snapshot.data),
                                                    title: snapshot
                                                        .data
                                                        ?.forecast
                                                        ?.forecastday
                                                        ?.first
                                                        .hour?[index]
                                                        .time,
                                                    temp: snapshot
                                                        .data
                                                        ?.forecast
                                                        ?.forecastday
                                                        ?.first
                                                        .hour?[index]
                                                        .tempC,
                                                    image: snapshot
                                                        .data
                                                        ?.forecast
                                                        ?.forecastday
                                                        ?.first
                                                        .hour?[index]
                                                        .condition
                                                        ?.icon,
                                                  );
                                                }),
                                          ),
                                          Spacer(),
                                          Center(
                                              child: Stack(
                                            children: [
                                              Image.asset(
                                                'assets/images/Rectangle3.png',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 32, top: 20),
                                                child: Image.asset(
                                                  'assets/images/Symbol (1).png',
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 80),
                                                child: Image.asset(
                                                  'assets/images/Subtract.png',
                                                  fit: BoxFit.cover,
                                                  height: 95,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 175, top: 12),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (_) {
                                                      return MyWidget();
                                                    }));
                                                  },
                                                  child: Container(
                                                    width: 64,
                                                    height: 64,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffF5F5F9),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 50,
                                                        color:
                                                            Color(0xff48319D),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 314, top: 35),
                                                child: Image.asset(
                                                  'assets/images/Symbol2.png',
                                                  fit: BoxFit.cover,
                                                  height: 44,
                                                ),
                                              )
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
