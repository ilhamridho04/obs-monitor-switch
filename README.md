# obs-monitor-switch

Script untuk mengganti scene secara dinamis berdasarkan posisi kursor mouse.

## Deskripsi

Script ini memungkinkan Anda untuk mengganti scene di OBS Studio secara otomatis berdasarkan posisi kursor mouse. Script ini sangat berguna jika Anda menggunakan beberapa monitor dan ingin scene di OBS Studio berubah sesuai dengan monitor yang aktif.

## Fitur

- Mengganti scene secara otomatis berdasarkan posisi kursor mouse.
- Mendukung hingga dua monitor.
- Log informasi dan peringatan untuk debugging.

## Persyaratan

- OBS Studio
- xdotool (harus terinstall di sistem Anda)
- Sistem operasi Linux

## Instalasi

1. Pastikan Anda telah menginstall OBS Studio dan xdotool di sistem Anda.
2. Download atau clone repository ini.
3. Buka OBS Studio dan masuk ke menu `Tools` -> `Scripts`.
4. Tambahkan script `ganti_monitor.lua` atau `monitor_switch.lua` dari repository ini.

## Konfigurasi

Anda dapat mengubah nama scene dan resolusi monitor di dalam script sesuai kebutuhan Anda:

```lua
-- Nama scene untuk monitor 1 dan monitor 2 (ubah sesuai kebutuhan)
local scene_monitor_1 = "Scene1" -- Nama scene untuk monitor 1
local scene_monitor_2 = "Scene2" -- Nama scene untuk monitor 2

-- Lebar monitor (sesuaikan dengan resolusi monitor Anda)
local monitor_width = 1366 -- Resolusi horizontal monitor pertama
local monitor_count = 2 -- Jumlah monitor yang digunakan