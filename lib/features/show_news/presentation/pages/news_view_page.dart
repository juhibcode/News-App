import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:news_app/features/show_news/presentation/pages/components/news_card.dart';
import 'package:news_app/features/show_news/presentation/pages/home_page.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({Key? key, required this.newsInfo}) :super(key: key);

  String _getDateInDDMMYYFormat(DateTime dateTime){
    return'${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios_new_rounded,
            color: Palette.deepBlue,
          size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                newsInfo.title!= null ? newsInfo.title! : '--No title--',
                style:TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height:16 ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child:newsInfo.imageURL != null ? Image.network(
                  newsInfo.imageURL!,
                  fit:BoxFit.cover,
                ):SizedBox(),

              ),
              const SizedBox(height:16 ),
              Text(
                _getDateInDDMMYYFormat(newsInfo.dateTime),
                style:TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height:16 ),
               Text(
                newsInfo.author != null ? newsInfo.author! : '--No author --',
                style:TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height:16 ),
               Text(
                newsInfo.content!=null ? newsInfo.content! : '--No content',
                style:TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

}
