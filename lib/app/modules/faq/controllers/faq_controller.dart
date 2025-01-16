import 'package:get/get.dart';

class FaqController extends GetxController {
  final dataFaq = [
    {
      "title": "Apa itu jasa maklon kosmetik?",
      "desc":
          "Jasa maklon kosmetik merupakan kerjasama jasa pembuatan produk kecantikan yang di produksi oleh perusahaan penyedia jasa maklon.\n\nPerusahaan jasa maklon memproduksi produk sesuai keinginan customer. Ini adalah solusi bagi Anda yang memiliki jaringan pemasaran luas dan ingin membranding produk anda sendiri, tetapi kesulitan untuk memproduksinya sendiri."
    },
    {
      "title":
          "Boleh bertanya dahulu sebelum menggunakan jasa maklon PT. Mash Moshem Indonesia?",
      "desc":
          "Pabrik kami memiliki sertifikat kelas A, jadi pabrik kami bisa memproduksi kosmetik dari rambut hingga kaki.\n\nKami siap menciptakan semua jenis kosmetik yang Anda butuhkan. Berbagai macam produk seperti Skincare, SPA Product, Fragrance, Baby Product, Mens Corner, dll.\n\nSelain produk-produk personal care, kami juga bisa menyediakan kosmetik sesuai keinginan Anda. Selengkapnya, silakan hubungi kami di kontak yang telah tersedia."
    },
    {
      "title": "Produk apa yang bisa dimaklonkan di PT. Mash Moshem Indonesia?",
      "desc":
          "Pabrik kami memiliki sertifikat kelas A, jadi pabrik kami bisa memproduksi kosmetik dari rambut hingga kaki.\n\nKami siap menciptakan semua jenis kosmetik yang Anda butuhkan. Berbagai macam produk seperti Skincare, SPA Product, Fragrance, Baby Product, Mens Corner, dll.\n\nSelain produk-produk personal care, kami juga bisa menyediakan kosmetik sesuai keinginan Anda. Selengkapnya, silakan hubungi kami di kontak yang telah tersedia."
    },
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
