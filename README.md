# Qibla Companion
[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Version](https://img.shields.io/badge/version-1.0-green.svg)](https://github.com/SidqiRaafi/qibla-companion)
[![License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/SidqiRaafi/qibla-companion/graphs/commit-activity)

A modern Flutter app providing Qibla direction and prayer times for Muslims.  
🕌 Built with [Flutter](https://flutter.dev/) · 📦 Integrates Firebase Auth & Firestore · 📍 Uses geolocation & compass

---

## 🚀 Features

- **Realtime Qibla Direction** – Accurate using your device’s sensors
- **Prayer Times Calculation** – Powered by [Adhan Dart](https://pub.dev/packages/adhan_dart)
- **Authentication** – Email/password sign-up & login with Firebase
- **User Profiles** – Securely stored in Firestore per user
- **Beautiful UI** – Custom splash, responsive layout, themed colors
- **Works Offline** – Basic Qibla always available

---
## 📸 Screenshots & Demo

<p align="center">
  <img src="assets/github_demo/1_splashscreen.jpg" width="180"/>
  <img src="assets/github_demo/2_auth_choice_menu.jpg" width="180"/>
  <img src="assets/github_demo/3_register.jpg" width="180"/>
  <img src="assets/github_demo/4_register_success.jpg" width="180"/>
  <img src="assets/github_demo/5_login.jpg" width="180"/>
  <img src="assets/github_demo/6_login_success.jpg" width="180"/>
  <img src="assets/github_demo/7_menu_qibla.jpg" width="180"/>
  <img src="assets/github_demo/8_menu_qibla_point.jpg" width="180"/>
  <img src="assets/github_demo/9_shala_time.jpg" width="180"/>
  <img src="assets/github_demo/10_about.jpg" width="180"/>
</p>

<p align="center">
  <video src="assets/github_demo/11_video_demo.mp4" width="360" controls></video>
</p>

---


## 🛠️ Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>= 3.9.2)
- A configured Firebase project (see below)

### 1. Clone the repo
```
git clone https://github.com/SidqiRaafi/qibla-companion.git
```
```
cd qibla-companion
```

### 2. Install dependencies
```
flutter pub get
```

### 3. Firebase Setup

- Download your `google-services.json` and/or `GoogleService-Info.plist`
- Add required Firebase configs.
- Generate `firebase_options.dart` using [`flutterfire configure`](https://firebase.flutter.dev/docs/cli/)

### 4. Run the app
```
flutter run
```
---

## 🤝 Contributing

Pull requests and suggestions are always welcome!  
1. Fork the repo
2. Create your feature branch (`git checkout -b feature/foo`)
3. Commit your changes (`git commit -am 'Add feature'`)
4. Push to the branch (`git push origin feature/foo`)
5. Open a [Pull Request](https://github.com/SidqiRaafi/qibla-companion/pulls)

---

## 🙏 Credits

- [SidqiRaafi](https://github.com/SidqiRaafi)
- Flutter, Firebase, Adhan Dart, flutter qiblah, geolocator & open source creators

---





