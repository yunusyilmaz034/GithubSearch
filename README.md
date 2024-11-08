# GithubSearch
SwiftUI ile MVVM-C tasarım deseni kullanarak, api tarafında combine kullanımı ile yapılmıştır.
# Uyumluluk
iOS 16 ve üzeri
SwiftUI 2 ve üzeri
Swift 5 ve üzeri
# Proje genel açıklaması
Github'da username, ile bir kullanıcının repo listesini getirir ve gelen listeden repo ayrıntılarını gösterir. Ayrıca kullanıcının profilini görmek için sağ üstteki simgeye de dokunabilirsiniz.

Proje MVVM-C (diğer adıyla Model - View - ViewModel - Coordinator) kullanıyor. Combine ile api işlemleri yapılmıştır. Ayrıca projede api işlemlerini denetleyecek mock data kullanarak unit testde yazılmıştır. Strategy patterni kullanarak network olmadığı durumlarda db den fetch ve bunun üzerinden işlem yapma gibi işlemler için alt yapı yazılmış olup sadece core data için geliştirme yapılmamıştır.
Saygılarımla. 
Yunus Yılmaz
