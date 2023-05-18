import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CurrentWeatherIcon extends StatelessWidget {
  final int iconCode;
  const CurrentWeatherIcon({
    super.key,
    required this.iconCode,
  });

  Widget _getWeatherIcon() {
    switch(iconCode) {
      case 395:
        return const Icon(CupertinoIcons.cloud_bolt_rain_fill, color: Colors.white);
      case 392:
        return const Icon(CupertinoIcons.cloud_bolt_rain, color: Colors.white);
      case 389:
        return const Icon(CupertinoIcons.cloud_bolt_rain, color: Colors.white);
      case 377:
      return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 374:
        return const Icon(CupertinoIcons.cloud_sleet, color: Colors.white);
      case 371:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 368:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 365:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 362:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 359:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 356:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 353:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 350:
        return const Icon(CupertinoIcons.snow, color: Colors.white);
      case 338:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 335:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 332:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 329:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 326:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 323:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 320:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 317:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 314:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 311:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 308:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 305:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 302:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 299:
        return const Icon(CupertinoIcons.cloud_heavyrain_fill, color: Colors.white);
      case 296:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 293:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 284:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 281:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 266:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 263:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 260:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 248:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 230:
        return const Icon(CupertinoIcons.wind_snow, color: Colors.white);
      case 227:
        return const Icon(CupertinoIcons.wind_snow, color: Colors.white);
      case 200:
        return const Icon(CupertinoIcons.cloud_bolt_fill, color: Colors.white);
      case 185:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 182:
        return const Icon(CupertinoIcons.cloud_sleet_fill, color: Colors.white);
      case 179:
        return const Icon(CupertinoIcons.cloud_snow_fill, color: Colors.white);
      case 176:
        return const Icon(CupertinoIcons.cloud_rain_fill, color: Colors.white);
      case 143:
        return const Icon(CupertinoIcons.cloud_fog_fill, color: Colors.white);
      case 122:
        return const Icon(CupertinoIcons.cloud_fill, color: Colors.white);
      case 119:
        return const Icon(CupertinoIcons.cloud_fill, color: Colors.white);
      case 116:
        return const Icon(CupertinoIcons.cloud_sun, color: Colors.white);
      case 113:
        return const Icon(CupertinoIcons.sun_max_fill, color: Colors.white);
    }
    return const Icon(Icons.cloud);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 50,
            height: 50,
            child: FittedBox(
                fit: BoxFit.contain,
                child: _getWeatherIcon(),
                ),
              ),
            ),
        ),
    );
  }
}