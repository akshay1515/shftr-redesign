import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyWebview extends StatefulWidget {
  final int pagecount;

  PrivacyWebview({Key? key, required this.pagecount}) : super(key: key);

  @override
  _PrivacyWebviewState createState() => _PrivacyWebviewState();
}

int count = 0;
List<String> showTitle = [
  "Dwolla's Privacy Policy",
  "Dwolla's Terms and Condition",
  "Shftr's Privacy Policy",
  "Shftr's Terms and Condition"
];

List<String> urls = [
  "https://dwolla.com/legal/privacy",
  "https://dwolla.com/legal/tos",
  "https://shifterteam.host",
  "https://shftr.app"
];

class _PrivacyWebviewState extends State<PrivacyWebview> {
  WebViewController? webViewController;

  SharedPreferences? _preferences;
  bool _isLoading = true;

  Future saveSharedPrefrences(int pagecount) async {
    _preferences = await SharedPreferences.getInstance();

    if (pagecount < urls.length - 1) {
      _preferences!.setString("status", "partial");
      _preferences!.setInt("count", pagecount);
    } else {
      _preferences!.setString("status", "complete");
      _preferences!.setInt("count", pagecount);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      count = widget.pagecount;
    });
  }

  void changeWebpage() {
    saveSharedPrefrences(count).then((value) {
      setState(() {
        count++;
      });
      changeUrl(count);
    });
  }

  changeUrl(int count) {
    if(count != widget.pagecount){
      changeLoading();
    }
    webViewController!.loadUrl(urls[count]);
  }

  changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade500,
          centerTitle: true,
          title: Text(
            showTitle[count],
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              userAgent:
                  'Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>',
              onWebViewCreated: (WebViewController controller) {
                webViewController = controller;
              },
              onProgress: (int progress) {},
              zoomEnabled: true,

              onPageStarted: (String url) {
                if(count == widget.pagecount){
                  changeLoading();
                }
              },
              onPageFinished: (String url) {
                changeLoading();
              },
              initialUrl: urls[count],
            ),
            Positioned(
                bottom: 0,
                left:75,
                right:75,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Wrap(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber.shade500,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 7,bottom: 7)
                          ),
                          onPressed: () {
                            if (count < urls.length - 1) {
                              changeWebpage();
                            } else {
                              saveSharedPrefrences(count).then((value) {
                                Navigator.of(context).pop();
                              });

                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_rounded,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Accept",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(${count + 1} / ${urls.length})",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )),
            Visibility(
                visible: !_isLoading,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.9),
                  child: Center(
                      child: Lottie.asset(
                          "assets/loading/animations/webpage-loading.json")),
                ))
          ],
        ));
  }
}
