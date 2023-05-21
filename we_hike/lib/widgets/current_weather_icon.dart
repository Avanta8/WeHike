import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CurrentWeatherIcon extends StatelessWidget {
  final int iconCode;
  const CurrentWeatherIcon({
    super.key,
    required this.iconCode,
  });

  // This method converts the api weaather icon code into a cupertino icon that flutter can display
  Widget _getWeatherIcon() {
    switch(iconCode) {
      case 1282:
        return const Icon(CupertinoIcons.cloud_bolt_rain_fill, color: Colors.white);
      case 1279:
        return const Icon(CupertinoIcons.cloud_bolt_rain, color: Colors.white);
      case 1276:
        return const Icon(CupertinoIcons.cloud_bolt_rain, color: Colors.white);
      case 1264:
      return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1261:
        return const Icon(CupertinoIcons.cloud_sleet, color: Colors.white);
      case 1258:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1255:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1252:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1249:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1246:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1243:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1240:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1237:
        return const Icon(CupertinoIcons.snow, color: Colors.white);
      case 1225:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1222:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1219:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1216:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1213:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1210:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1207:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1204:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1201:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1198:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1195:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 1192:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 1189:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 1186:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 1183:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1180:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1171:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1168:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1153:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1150:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1147:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 1135:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 1117:
        return const Icon(CupertinoIcons.wind_snow, color: Colors.white);
      case 1114:
        return const Icon(CupertinoIcons.wind_snow, color: Colors.white);
      case 1087:
        return const Icon(CupertinoIcons.cloud_bolt_fill, color: Colors.white);
      case 1072:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1069:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 1066:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 1063:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 1030:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 1009:
        return const Icon(CupertinoIcons.cloud_fill, color: Colors.white);
      case 1006:
        return const Icon(CupertinoIcons.cloud_fill, color: Colors.white);
      case 1003:
        return const Icon(CupertinoIcons.cloud_sun, color: Colors.white);
      case 1000:
        return const Icon(CupertinoIcons.sun_max_fill, color: Colors.white);
    }
    return const Icon(Icons.cloud);
  }

  // The build method returns the appropriate widget with some padding
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: Center(

          // The combination of SizedBox and FittedBox allows the widget to expand to a fixed size
          child: SizedBox(
            width: 50,
            height: 50,
            child: FittedBox(
                fit: BoxFit.contain,
                child: _getWeatherIcon(),
                ),
              ),
            ),
    );
  }
}