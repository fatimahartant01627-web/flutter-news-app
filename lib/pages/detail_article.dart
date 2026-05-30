import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appgetx/main.dart';

import 'package:news_appgetx/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Artikel ${article.title}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              icon: Icon(Icons.bookmark_added_rounded),
              onPressed: () {},
              tooltip: 'simpan',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.blueGrey.withValues(alpha: 0.1),
                    Colors.blueGrey.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: MainApp.beige.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: MainApp.beige.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Text(
                      article.category,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              article.title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: MainApp.navy,
                height: 1.15,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.verified_rounded,
                  color: MainApp.navy.withValues(alpha: 0.7),
                  size: 18,
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${article.source} - ${article.time}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: MainApp.navy.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
