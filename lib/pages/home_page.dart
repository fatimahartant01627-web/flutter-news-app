import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appgetx/data/article_dummy.dart';
import 'package:news_appgetx/data/category.dart';
import 'package:news_appgetx/main.dart';
import 'package:news_appgetx/pages/detail_article.dart';
import 'package:news_appgetx/widgets/article_tile.dart';
import 'package:news_appgetx/widgets/featured_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final searchController = TextEditingController();
  int _pilihindex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> kategori = dummyKategori;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App futem',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              tooltip: 'Notifications',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded),
              tooltip: 'Notifications',
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 178, 213, 243),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Selamat Datang, futyymm! Mau baca apa hari ini?',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: MainApp.navy,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Cari berita...',
              prefixIcon: Icon(Icons.search_rounded),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.tune_rounded),
                tooltip: 'Filter',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: MainApp.navy.withValues(alpha: 0.1),
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemBuilder: (context, index) {
                final bool isSelected = _pilihindex == index;
                return FilterChip(
                  selected: isSelected,
                  label: Text(
                    kategori[index],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      _pilihindex = index;
                    });
                  },
                  showCheckmark: false,
                  selectedColor: MainApp.navy,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : MainApp.navy,
                  ),
                  side: BorderSide(color: MainApp.navy.withValues(alpha: 0.1)),
                  backgroundColor: Colors.white,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: kategori.length,
            ),
          ),
          SizedBox(height: 18),
          FeaturedCard(
            title: 'Berita Terkini',
            subtitle: 'Berita terbaru dan paling populer',
            onTap: () {},
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Terbaru',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MainApp.navy,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lihat Semua',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MainApp.navy,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 12,
              crossAxisSpacing: 12,
              mainAxisSpacing: 0.85,
            ),
            itemBuilder: (context, index) {
              final article = dummyArticle[index];
              return ArticleGridCard(
                article: article,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => ArticleDetailPage(article: article),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
