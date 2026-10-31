import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Projenizin main.dart dosyasını doğru şekilde içeri aktarın.
// Proje adınızın 'flutter_proto_1' veya 'flutter_test_app' olmasına göre
// burayı kontrol etmeniz gerekebilir. Ben 'main.dart' dosyasının
// uygulamanızın ana dizininde (lib/) olduğunu varsayarak düzelttim.
import 'package:flutter_proto_1/main.dart'; 

void main() {
 // Tüm testler için başlangıçta tek bir uygulama başlatma fonksiyonu tanımlayalım.
 Future<void> startApp(WidgetTester tester) async {
 await tester.pumpWidget(const LivestockManagementApp());
 await tester.pumpAndSettle();
 }

 group('LoginScreen Testleri', () {
 testWidgets('Uygulama başarıyla başlar ve Giriş Ekranını (LoginScreen) gösterir', (WidgetTester tester) async {
 await startApp(tester);

 // LoginScreen'deki ana metinleri kontrol et
 expect(find.text('Büyükbaş Yönetim'), findsWidgets, reason: 'Başlık görünmeli');
 expect(find.text('Hayvan Takip Sistemi'), findsOneWidget, reason: 'Alt başlık görünmeli');
 
 // Kullanıcı tipi butonlarının varlığını kontrol et
 expect(find.text('Hayvancı'), findsOneWidget, reason: 'Hayvancı seçeneği görünmeli');
 expect(find.text('Veteriner'), findsOneWidget, reason: 'Veteriner seçeneği görünmeli');
 
 // Giriş yap butonunu kontrol et
 expect(find.text('Giriş Yap'), findsOneWidget, reason: 'Giriş butonu görünmeli');
 });

 testWidgets('Boş kullanıcı adı girişi engeller', (WidgetTester tester) async {
 await startApp(tester);

 // Kullanıcı adı girmeden giriş yap butonuna tıkla
 await tester.tap(find.text('Giriş Yap'));
 await tester.pumpAndSettle();

 // Hala Login ekranında olduğunu kontrol et (bir sonraki ekrana geçiş yok)
 expect(find.text('Hayvan Takip Sistemi'), findsOneWidget);
 });

 testWidgets('Çiftçi (farmer) kullanıcısı ile giriş başarılı', (WidgetTester tester) async {
 await startApp(tester);

 // Kullanıcı adı gir
 await tester.enterText(
 find.byType(TextField),
 'Test Çiftçi',
 );

 // Giriş yap butonuna tıkla
 await tester.tap(find.text('Giriş Yap'));
 await tester.pumpAndSettle(); 

 // Ana ekrana geçildiğini ve Hayvanlar sekmesinin yüklendiğini kontrol et
 expect(find.text('Panel'), findsOneWidget, reason: 'Giriş sonrası Ana Ekran (Panel) görünmeli');
 expect(find.text('Yeni Hayvan Ekle'), findsNothing, reason: 'Panelde "Yeni Hayvan Ekle" görünmemeli');
 });

 testWidgets('Veteriner (vet) kullanıcısı ile giriş başarılı', (WidgetTester tester) async {
 await startApp(tester);

 // Veteriner seçeneğine tıkla
 await tester.tap(find.text('Veteriner'));
await tester.pump(); // State değişikliğini uygula

 // Kullanıcı adı gir
 await tester.enterText(
 find.byType(TextField),
 'Test Veteriner',
 );

 // Giriş yap butonuna tıkla
 await tester.tap(find.text('Giriş Yap'));
 await tester.pumpAndSettle();

 // Ana ekrana geçildiğini kontrol et
 expect(find.text('Panel'), findsOneWidget, reason: 'Giriş sonrası Ana Ekran (Panel) görünmeli');
 expect(find.textContaining('Test Veteriner (Veteriner)'), findsOneWidget, reason: 'Kullanıcı rolü görünmeli');
});
 });

 group('MainScreen Navigasyon ve İçerik Testleri', () {
 // Ana ekrana giden yardımcı fonksiyon
 Future<void> navigateToMain(WidgetTester tester) async {
 await startApp(tester);
 await tester.enterText(find.byType(TextField), 'Test User');
 await tester.tap(find.text('Giriş Yap'));
 await tester.pumpAndSettle();
 }

 testWidgets('Dashboard doğru istatistikleri ve uyarıyı gösterir', (WidgetTester tester) async {
 await navigateToMain(tester);

 // Dashboard'daki kart başlıklarını kontrol et
 expect(find.text('Sığır'), findsOneWidget); // Hem Sığır hem de Toplam hayvan için kullanılıyor.
 expect(find.text('Buffalo'), findsOneWidget);
expect(find.text('Doğum'), findsOneWidget);
 expect(find.text('Ölüm'), findsOneWidget);

      // Yaklaşan aşı uyarısını kontrol et (30 gün içinde 2 aşı var)
      expect(find.textContaining('aşı 30 gün içinde yapılacak'), findsOneWidget, reason: 'Aşı uyarısı görünmeli');
 });

 testWidgets('Bottom navigation ve sekme geçişleri doğru çalışır', (WidgetTester tester) async {
 await navigateToMain(tester);

 // 1. Hayvanlar sekmesine geç (Çiftçi rolünde)
 await tester.tap(find.text('Hayvanlar'));
 await tester.pumpAndSettle();
 expect(find.text('Yeni Hayvan Ekle'), findsOneWidget, reason: 'Hayvanlar sekmesinde ekle butonu olmalı');
      expect(find.text('001TR'), findsOneWidget, reason: 'Hayvan listesinden ilk hayvan görünmeli');

 // 2. Aşılar sekmesine geç
 await tester.tap(find.text('Aşılar'));
 await tester.pumpAndSettle();
      expect(find.text('Şap'), findsOneWidget, reason: 'Aşı listesinden aşı adı görünmeli');
      expect(find.text('Sonraki: 2025-03-15'), findsOneWidget, reason: 'Sonraki aşı tarihi görünmeli');

 // 3. Kayıtlar sekmesine geç
 await tester.tap(find.text('Kayıtlar'));
 await tester.pumpAndSettle();
 expect(find.text('Yeni Kayıt Ekle'), findsOneWidget, reason: 'Kayıtlar sekmesinde ekle butonu olmalı');
      expect(find.text('Sağlıklı doğum'), findsOneWidget, reason: 'Kayıt detayları görünmeli');

 // 4. Panel sekmesine geri dön
 await tester.tap(find.text('Panel'));
 await tester.pumpAndSettle();
 expect(find.text('Doğum'), findsOneWidget, reason: 'Panele geri dönüldüğünde istatistikler görünmeli');
 });
 });
}
