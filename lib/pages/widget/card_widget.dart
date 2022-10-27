import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatefulWidget {

  String _image;
  String _page_name;

  CardWidget(this._image, this._page_name);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  final Uri toLaunch_lab = Uri(scheme: 'http', host: 'uzdepo.uz', path: 'lab');
  final Uri toLaunch_rem = Uri(scheme: 'https', host: 'uzdepo.uz', path: 'index.php');
  final Uri toLaunch_rash = Uri(scheme: 'https', host: 'depouzbekistan', path: 'app/');
  final Uri toLaunch_e_not = Uri(scheme: 'https', host: 'depouzbekistan.uz', path: 'dpx-lib/');
  final Uri toLaunch_map = Uri(scheme: 'https', host: 'depouzbekistan.uz', path: 'open-beta2/');

  _switchKeys(){
    switch(widget._page_name){
      case "Labaratoriya" : {
        setState(() {
          _launched = _launchInWebViewOrVC(toLaunch_lab);
        });
      } break;

      case "Анализ ремонта" : {
        setState(() {
        _launched = _launchInWebViewOrVC(toLaunch_rem);
      });
      } break;

      case "Расшифрофка" : {
        setState(() {
          _launched = _launchInWebViewOrVC(toLaunch_rash);
        });
      } break;

      case "E-NOTES" : {
        setState(() {
          _launched = _launchInWebViewOrVC(toLaunch_e_not);
        });
      } break;

      case "Map" : {
        setState(() {
          _launched = _launchInWebViewOrVC(toLaunch_map);
        });
      } break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 25),
        height: h/5,
        decoration: BoxDecoration(
          //shadow
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
          onPressed: (){
            _switchKeys();
          },
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      widget._image,
                    ),
                  ),
                ),
              ),
              Container(
                height: h/15,
                child: Center(
                  child: Text(
                    widget._page_name,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
