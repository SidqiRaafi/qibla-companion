import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';

class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({Key? key}) : super(key: key);

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  DateTime? fajrTime;
  DateTime? dhuhrTime;
  DateTime? asrTime;
  DateTime? maghribTime;
  DateTime? ishaTime;
  
  String _timeRemaining = '00:00:00';
  String _nextPrayerName = '';
  Timer? _countdownTimer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadPrayerTimes() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      Coordinates coordinates = Coordinates(
        position.latitude,
        position.longitude,
      );

      CalculationParameters params = CalculationMethodParameters.muslimWorldLeague();
      params.madhab = Madhab.hanafi;

      PrayerTimes prayerTimes = PrayerTimes(
        coordinates: coordinates,
        date: DateTime.now(),
        calculationParameters: params,
      );

      setState(() {
        fajrTime = prayerTimes.fajr.toLocal();
        dhuhrTime = prayerTimes.dhuhr.toLocal();
        asrTime = prayerTimes.asr.toLocal();
        maghribTime = prayerTimes.maghrib.toLocal();
        ishaTime = prayerTimes.isha.toLocal();
        _isLoading = false;
      });

      _startCountdown();
    } catch (e) {
      print('Error loading prayer times: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startCountdown() {
    _updateCountdown();
    
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateCountdown();
    });
  }

  void _updateCountdown() {
    DateTime now = DateTime.now();
    
    List<MapEntry<String, DateTime?>> prayers = [
      MapEntry('fajr', fajrTime),
      MapEntry('dhuhr', dhuhrTime),
      MapEntry('asr', asrTime),
      MapEntry('maghrib', maghribTime),
      MapEntry('isha', ishaTime),
    ];

    DateTime? nextPrayerTime;
    String nextPrayerName = '';

    for (var prayer in prayers) {
      if (prayer.value != null && prayer.value!.isAfter(now)) {
        nextPrayerTime = prayer.value;
        nextPrayerName = prayer.key;
        break;
      }
    }

    if (nextPrayerTime == null) {
      _loadPrayerTimes();
      return;
    }

    Duration difference = nextPrayerTime.difference(now);
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    int seconds = difference.inSeconds.remainder(60);

    setState(() {
      _nextPrayerName = nextPrayerName;
      _timeRemaining = '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    });
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return DateFormat('HH:mm').format(time);
  }

  Widget _buildPrayerCard(String name, DateTime? time, bool isNext) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDarkGray,
            ),
          ),
          Text(
            _formatTime(time),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.primaryOrange,
              ),
              SizedBox(height: 20),
              Text(
                'Loading prayer times...',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (fajrTime == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 60,
                color: AppColors.textDark,
              ),
              SizedBox(height: 20),
              Text(
                'Unable to load prayer times',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please check your location settings',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-waktu.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.4),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.prayerTimesTitle,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfbe9cf),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _timeRemaining,
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfbe9cf),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                _buildPrayerCard(
                  AppStrings.subuh,
                  fajrTime,
                  _nextPrayerName == 'fajr',
                ),
                _buildPrayerCard(
                  AppStrings.zuhur,
                  dhuhrTime,
                  _nextPrayerName == 'dhuhr',
                ),
                _buildPrayerCard(
                  AppStrings.ashar,
                  asrTime,
                  _nextPrayerName == 'asr',
                ),
                _buildPrayerCard(
                  AppStrings.magrib,
                  maghribTime,
                  _nextPrayerName == 'maghrib',
                ),
                _buildPrayerCard(
                  AppStrings.isya,
                  ishaTime,
                  _nextPrayerName == 'isha',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
