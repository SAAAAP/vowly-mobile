# VOWLY-MOBILE

⚙️ REQUIREMENTS
Install terlebih dahulu
Frontend
Flutter SDK
Dart SDK
Android Studio / VS Code
Backend
Node.js
npm
Database
Neon PostgreSQL
📦 INSTALLATION
1. Clone Repository
git clone https://github.com/username/vowly.git
2. Masuk Project
cd VOWLY
🔥 BACKEND SETUP
1. Masuk Folder Backend
cd backend
2. Install Dependency Backend
npm install
3. Install Package Backend Manual
npm install express cors dotenv bcryptjs jsonwebtoken prisma @prisma/client socket.io nodemon
4. Buat File .env
backend/.env
DATABASE_URL="YOUR_NEON_DATABASE_URL"

JWT_SECRET=vowly_secret_key

PORT=5000
5. Prisma Generate
npx prisma generate
6. Prisma Migration
npx prisma migrate dev --name init
7. Jalankan Backend
npm run dev
✅ Backend Running

Jika berhasil:

Server running on port 5000
📱 FRONTEND SETUP
1. Kembali ke Root Project
cd ..
2. Install Dependency Flutter
flutter pub get
3. Jalankan Flutter
Android Emulator
flutter run
Flutter Web
flutter run -d chrome
🌐 API CONFIGURATION
File
lib/core/services/api_service.dart
Android Emulator
baseUrl: 'http://10.0.2.2:5000/api/'
Flutter Web / HP Fisik
baseUrl: 'http://YOUR_IP_ADDRESS:5000/api/'


IPv4 Address
📦 FLUTTER PACKAGES
pubspec.yaml
dependencies:
  flutter:
    sdk: flutter

  provider: ^6.1.2
  dio: ^5.4.2
  shared_preferences: ^2.2.3
  socket_io_client: ^2.0.3+1
🛠️ RUNNING PROJECT

#Terminal 1 → Backend
cd backend
npm run dev

#Terminal 2 → Flutter
flutter run
