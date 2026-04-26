# Mood Detector 📱  
Aplikasi Deteksi Kondisi Pengguna Berbasis Sensor (Flutter)

```
Nama: Zyrus Alfredo Randan Malinggato
NIM: 2409116120
Program Studi: Sistem Informasi '24
Mata Kuliah: Pemograman Aplikasi Bergerak
```

## 📱 Deskripsi
**Mood Detector** adalah aplikasi mobile berbasis Flutter yang memanfaatkan sensor smartphone untuk mengestimasi kondisi pengguna secara real-time. Aplikasi ini menggunakan data dari beberapa sensor seperti accelerometer, gyroscope, dan ambient light sensor untuk menghasilkan informasi berupa “mood” atau kondisi pengguna secara sederhana. Aplikasi ini bertujuan sebagai eksplorasi pemanfaatan sensor dalam pengembangan aplikasi mobile yang interaktif dan responsif.

<img width="1080" height="1080" alt="Copy of Copy of Halaman RT(BS)" src="https://github.com/user-attachments/assets/6d7071f6-0820-4d12-b6cb-39f3954d9336" />

---

## 🚀 Fitur Utama

<img width="1920" height="1080" alt="Untitled design" src="https://github.com/user-attachments/assets/8b7095fe-2740-48e7-88a3-33b22dbd7c05" />

- 📊 Deteksi kondisi pengguna secara real-time
- 📡 Menggunakan 3 sensor:
  - Accelerometer (gerakan)
  - Gyroscope (rotasi)
  - Ambient Light Sensor (cahaya)
- 🧠 Rule-based mood detection
- 🔄 Mood Stabilizer (mengurangi fluktuasi)
- 📈 Confidence Score (tingkat keyakinan)
- 🕒 Riwayat mood (history)
- 🎨 UI modern (dark mode + gradient + animasi)
- ⚠️ Sensor fallback jika tidak tersedia

---

## 🧠 Cara Kerja

Alur sistem:
Penjelasan singkat:

1. Sensor membaca data perangkat
2. Data diolah menjadi:
   - Movement Score
   - Rotation Score
   - Light Level
3. Mood ditentukan menggunakan rule-based logic
4. Hasil distabilkan dengan Mood Stabilizer
5. Ditampilkan ke UI secara real-time

---

## 📐 Algoritma Sederhana

Contoh rule:

- Calm → gerakan rendah + cahaya terang  
- Energetic → gerakan tinggi + rotasi tinggi  
- Sleepy → gerakan rendah + kondisi gelap  
- Focused → gerakan sedang + cahaya terang  
- Neutral → kondisi tidak dominan  

---

## 🏗️ Struktur Project
<img width="230" height="497" alt="image" src="https://github.com/user-attachments/assets/6fe0a9d8-a91d-45bb-adda-2dcbc4f0607a" />

---

## 🛠️ Teknologi yang Digunakan
- Flutter
- Dart
- sensors_plus
- ambient_light

---

© Zyrus Alfredo Randan Malinggato - 2026
