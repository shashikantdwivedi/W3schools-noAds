import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w3school/db.dart';
import 'components/bottomBar.dart';
import 'components/appBar.dart';
import 'blackBox.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/settingsModel.dart' as settingModel;

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var darkModeStateEnabled = false;
  var enableAdStateEnabled = false;
  var appID =
      'https://play.google.com/store/apps/details?id=com.shashikantdwivedi.w3school';

  void about() {
    return showAboutDialog(
        context: context,
        applicationName: 'W3Schools (No Ads)',
        applicationVersion: 'Version 1.0',
        applicationLegalese:
            'This app does not claim any copyright on the content displayed. W3schools.com is the real owner of the content displayed.');
  }

  void donateOption() async {
    const url = 'https://ko-fi.com/w3schoolsnoads';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var blackBoxProvider = Provider.of<BlackBox>(context);
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: bottomBar(blackBoxProvider, context),
            appBar: appBar('Settings', false, context),
            body: Container(
              child: ListView(children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    title: Text('Dark Mode',
                        style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                    subtitle: Text(
                        'This mode will enable the dark mode in the code section of the app',
                        style: TextStyle(fontFamily: 'Gilroy Light')),
                    trailing: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: blackBoxProvider.getDarkMode,
                        onChanged: (val) {
                          if (val) {
                            blackBoxProvider.getSettings[1].value = '1';
                          } else {
                            blackBoxProvider.getSettings[1].value = '0';
                          }
                          DB.update(settingModel.Settings.table, blackBoxProvider.getSettings[1]);
                          blackBoxProvider.setDarkMode = val;
                        }),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    title: Text('Enable Ads',
                        style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                    subtitle: Text(
                        'Enable ads to support the w3schools.com owners. This app does not contain any ads in itself.',
                        style: TextStyle(fontFamily: 'Gilroy Light')),
                    trailing: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: blackBoxProvider.getAds,
                        onChanged: (val) {
                          if (val) {
                            blackBoxProvider.getSettings[2].value = '1';
                          } else {
                            blackBoxProvider.getSettings[2].value = '0';
                          }
                          DB.update(settingModel.Settings.table, blackBoxProvider.getSettings[2]);
                          blackBoxProvider.setAds = val;
                        }),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/reportProblem');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        title: Text('Report Problem',
                            style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                        subtitle: Text(
                            'Report any problem you faced while using the app',
                            style: TextStyle(fontFamily: 'Gilroy Light')),
                        trailing: IconButton(
                            icon: Icon(Icons.report), onPressed: null),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      donateOption();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        title: Text('Donate',
                            style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                        subtitle: Text('Donate to support the app developers',
                            style: TextStyle(fontFamily: 'Gilroy Light')),
                        trailing: IconButton(
                            icon: Icon(Icons.attach_money), onPressed: null),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      Share.share(appID, subject: 'W3Schools App (No Ads)');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        title: Text('Share App',
                            style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                        subtitle: Text(
                            'Share the app to help other developers learn web development',
                            style: TextStyle(fontFamily: 'Gilroy Light')),
                        trailing: Container(
                          child: IconButton(
                              icon: Icon(Icons.share), onPressed: null),
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      about();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                          title: Text('About App',
                              style: TextStyle(fontFamily: 'Gilroy SemiBold')),
                          trailing: IconButton(
                              icon: Icon(Icons.info), onPressed: null)),
                    ))
              ]),
            )));
  }
}
