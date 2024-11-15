import 'package:flutter/material.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/faq/item_faq_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        "title":
            "Produk apa yang bisa dimaklonkan di PT. Mash Moshem Indonesia?",
        "desc":
            "Pabrik kami memiliki sertifikat kelas A, jadi pabrik kami bisa memproduksi kosmetik dari rambut hingga kaki.\n\nKami siap menciptakan semua jenis kosmetik yang Anda butuhkan. Berbagai macam produk seperti Skincare, SPA Product, Fragrance, Baby Product, Mens Corner, dll.\n\nSelain produk-produk personal care, kami juga bisa menyediakan kosmetik sesuai keinginan Anda. Selengkapnya, silakan hubungi kami di kontak yang telah tersedia."
      },
    ];
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FAQ", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView.builder(
          itemCount: dataFaq.length,
          itemBuilder: (context, index) => ItemFaq(
            title: dataFaq[index]["title"],
            desc: dataFaq[index]["desc"],
          ),
        ),
      ),
    );
  }
}
