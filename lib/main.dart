import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (v) {
              print(v.toString());
              showDialog(
                  context: context,
                  builder: (_) {
                    return Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Color(0XFFFCB800),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Loading . .. ...",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Color(0XFFFCB800),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    );
                  });
            },
            onPageFinished: (v) {
              print("hello$v");
              Navigator.pop(context);
            },
            initialUrl: "https://jomorder.app/public/auth/login"),
      ),
    );
  }
}
