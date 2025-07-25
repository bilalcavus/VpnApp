# VPN App

Flutter ile geliştirilmiş, çok katmanlı mimariye sahip, study case amaçlı bir VPN uygulaması.

## Özellikler

- Ülke listesi ve ülke arama
- Mock verilerle bağlantı/bağlantı kesme simülasyonu
- Bağlantı istatistikleri (hız, süre, vb.)
- Modern ve animasyonlu kullanıcı arayüzü


## Kurulum

### Gereksinimler

- Flutter SDK (>=3.4.3 <4.0.0)
- Gerekli platform araçları (Android Studio, Xcode, vs.)

### Adımlar

1. **Projeyi Klonlayın**
   ```sh
   git clone https://github.com/bilalcavus/VpnApp.git
   cd vpn_app
   ```

2. **Bağımlılıkları Yükleyin**
   ```sh
   flutter pub get
   ```

3. **Projeyi Çalıştırın**
   - Android/iOS:
     ```sh
     flutter run
     ```
   - Web:
     ```sh
     flutter run -d chrome
     ```
   - Masaüstü (Windows/Mac/Linux):
     ```sh
     flutter run -d windows
     ```

## Kullanım

- Uygulama açıldığında ülke listesi görüntülenir ve bir ülkeye bağlanmanız beklenir.
- Bağlantı sağlandıktan sonra bağlantı ülkesi ve istatistikleri görüntülenir.
- Arama çubuğu ile ülke/şehir arayabilirsiniz.
- Bir ülkeye tıklayarak bağlantı simülasyonu başlatılır.
- Bağlantı ve bağlantı kesme işlemleri mock verilerle simüle edilir.
- Setting sekmesinden uygulamanın koyu/açık teması değiştirebilir.

## Proje Mimarisi

```
lib/
  core/         # Temel yardımcılar, tema, DI
  data/         # Mock veri kaynakları, modeller
  domain/       # Entity, repository, use case
  presentation/ # View, ViewModel (MVVM), widget
  assets/       # Bayraklar, animasyonlar
```

- **Katmanlı mimari** (Clean Architecture yaklaşımı: Presentation Layer, Domain Layer, Data Layer)
- **MVVM (Model-View-ViewModel) mimarisi:**  View ve ViewModel ayrımı sayesinde UI ve iş mantığı ayrılır. ViewModel ilgili veriyi Model / repository'den alır, veriyi işler ve View'a gönderir.
- **Dependency Injection:** get_it
- **State Management & Navigation:** GetX
- **Mock veri kaynakları:** Backend bağımsız geliştirme

## Kullanılan Paketler

| Paket                        | Amaç / Kullanım Nedeni                                      |
|------------------------------|-------------------------------------------------------------|
| flutter                      | Flutter SDK, temel framework                                |
| cupertino_icons              | iOS tarzı ikonlar                                           |
| get                          | State management, navigation ve reaktif yapı için           |
| hugeicons                    | Zengin ikon seti                                            |
| get_it                       | Dependency injection (bağımlılık yönetimi)                  |
| equatable                    | Model karşılaştırmalarında kolaylık                         |
| lottie                       | Animasyon gösterimi için                                    |
| shared_preferences           | Lokal veri tutma (seçilen temayı tutmak için kullanılıyor)  |
| json_annotation              | JSON serileştirme işlemleri için                            |
| flutter_test                 | Flutter test                                                |
| leak_tracker                 | Bellek sızıntısı tespiti                                    |
| build_runner                 | Kod üretimi ve otomasyon                                    |
| json_serializable            | JSON serileştirme için kod üretimi (g.dart modelleri için)  |


## Testler

Projedeki testler, uygulamanın temel işlevlerinin ve MVVM katmanlarının doğru çalıştığını doğrulamak için yazıldı. Testler `test/` klasöründe yer almaktadır:

- **country_view_model_test.dart**
  - `CountryViewModel`'in ülke listesini başarıyla çekmesi, hata durumunu yönetmesi ve filtreleme fonksiyonunu test eder.
- **connection_stats_view_model_test.dart**
  - `ConnectionStatsViewModel`'in bağlantı istatistiklerini çekmesi, bağlantı ve bağlantı kesme işlemlerini ve hata yönetimini test eder.
- **country_repository_impl_test.dart**
  - `CountryRepositoryImpl`'in mock veri kaynağından ülke listesini başarıyla çekip çekmediğini ve hata durumunu test eder.
- **connection_stats_repository_impl_test.dart**
  - `ConnectionStatsRepositoryImpl`'in mock veri kaynağından bağlantı istatistiklerini başarıyla çekip çekmediğini ve hata durumunu test eder.
- **free_locations_repository_impl_test.dart**
  - `FreeLocationsRepositoryImpl`'in mock veri kaynağından ücretsiz lokasyonları başarıyla çekip çekmediğini ve hata durumunu test eder.

Testleri çalıştırmak için:

```sh
flutter test
```


## Not
- Proje study case amaçlıdır.
  

## Görüntüler
<p align="left">
  <img src="assets/screenshots/demo.gif" width="200" />
  <img src="assets/screenshots/home_light.png" width="200" />
  <img src="assets/screenshots/disconnect_light.png" width="200" />
  <img src="assets/screenshots/countries_light.png" width="200" />
  <img src="assets/screenshots/demo2.gif" width="200" />
  <img src="assets/screenshots/splash_dark.png" width="200" />
  <img src="assets/screenshots/home_dark.png" width="200" />
  <img src="assets/screenshots/country_info_dark.png" width="200" />
</p>


