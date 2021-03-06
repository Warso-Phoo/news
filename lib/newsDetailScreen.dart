import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/newsUnits.dart';
import 'package:news/webLaunch.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final String agoText;
  final Article article;
  final int index;

  NewsDetailScreen({
    this.article,
    this.agoText,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              fit: BoxFit.fill,
              placeholder: kTransparentImage,
              image: article.urlToImage,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(
                    article.source.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                  child: Container(
                    height: 3.0,
                    width: 3.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
                  child: Text(
                    agoText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.launch,color: Colors.white,),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => WebLaunch(
                          url: article.url,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(article.url)) {
      return Scaffold(
        appBar: AppBar(),
        //body: launch(article.url,forceWebView: true,enableJavaScript: true,),
      );
      //await launch(article.url,forceWebView: true,enableJavaScript: true,);
    } else {
      throw 'Could not launch ${article.url}';
    }
  }

}
