import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudheer Medidi App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sudheer Medidi App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void launchWhatsApp({@required number,@required message}) async {
    String url = 'whatsapp://send?phone=$number&text=$message';
    await canLaunch(url) ? launch(url) : print("Can't open WhatsApp");
  }

  void launchApp({@required messages}) async {
    String url = "https://wa.me/?text=$messages";
    await canLaunch(url) ? launch(url) : print("Can't open WhatsApp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.yellowAccent,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown, width: 2
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('SHARE VIA WHATSAPP', style: TextStyle(fontSize: 25, color: Colors.green),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      launchApp(messages: 'Hello! Have a Nice Day');
                    },
                    child: Text('Click Here to Share', style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(Icons.share),
                  )
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        launchWhatsApp(number: '+918790156655', message: 'Hello Sudheer! Choose one = {Chicken Biryani, Kabab Biryani, Mutton Biryani, Mixed Mogalai}');
                      },
                      child: Text('Click Here to Share to Sudheer', style: TextStyle(fontSize: 18),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(Icons.share),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
