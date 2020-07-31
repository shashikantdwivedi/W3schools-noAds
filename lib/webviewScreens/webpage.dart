import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../blackBox.dart';
import '../home.dart';
import 'disableAds.dart';
import 'darkTheme.dart';
import 'launchUrl.dart';

class WebPage extends StatefulWidget {
  WebPage({this.url});

  final url;

  @override
  _WebPage createState() => url != null ? _WebPage(url: url) : _WebPage();
}

class _WebPage extends State<WebPage> {
  _WebPage({this.url});

  String url;

  checkInternetConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);

    return WebView(
      initialUrl: url == null ? 'https://www.w3schools.com' : url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        blackBoxProvider.setController = controller;
      },
      navigationDelegate: (NavigationRequest req) async {
        blackBoxProvider.setPageLoaded = false;
        print(req.url);
        if (req.url.split('/')[2] != 'www.w3schools.com') {
          if (req.url.split('/')[2] == 'www.google.com') {
            blackBoxProvider.setBottomBarPreviousIndex = 0;
            blackBoxProvider.setBottomBarIndex = 0;
            return NavigationDecision.navigate;
          } else {
            launchURL(req.url);
            return NavigationDecision.prevent;
          }
        }
        if (!await checkInternetConnection()) {
          Navigator.pushNamed(context, '/noInternet');
        }
//        if (req.url != 'https://www.w3schools.com/') {
//          Navigator.pushNamed(context, '/home', arguments: req.url);
//          return NavigationDecision.prevent;
//        }
        return NavigationDecision.navigate;
      },
      onPageStarted: (pageURL) {
        blackBoxProvider.setCurrentURL = pageURL;
        if (blackBoxProvider.getSettings[2].value == '0') {
          disableAds(blackBoxProvider.getController);
        }
        if (blackBoxProvider.getDarkMode) {
          darkTheme(blackBoxProvider);
        }
        print('#### Page Started Loading ###');
      },
      onPageFinished: (pageURL) {
        blackBoxProvider.setPageLoaded = true;
        print(blackBoxProvider.getPageLoaded);
        print('#### Page Finished Loading ###');
        blackBoxProvider.getController.getTitle().then((value) {
          blackBoxProvider.setCurrentTitle = value;
          print(value);
        });
        if (blackBoxProvider.getSettings[2].value == '0') {
          disableAds(blackBoxProvider.getController);
        }
        if (blackBoxProvider.getDarkMode) {
          darkTheme(blackBoxProvider);
        }
      },
      onWebResourceError: (webError) {},
    );
  }
}
