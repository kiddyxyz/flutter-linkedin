import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

class JobDetail extends StatefulWidget {
  final String title, company, location, timestamp, images;

  JobDetail(
    this.title,
    this.images,
    this.company,
    this.location,
    this.timestamp,
  );

  @override
  _JobDetailState createState() => _JobDetailState(title, images, company, location, timestamp);
}

class _JobDetailState extends State<JobDetail> {
  String title, company, location, timestamp, images;

  _JobDetailState(
    this.title,
    this.images,
    this.company,
    this.location,
    this.timestamp,
  );

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.parse(this.timestamp);

    return new Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Job Detail - ${this.company} (${this.title})", style: TextStyle(fontSize: 14.0),),
      ),
      body: new ListView(
        padding: new EdgeInsets.all(10.0),
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.grey), color: Colors.white),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/tellbanner.png'),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Image.asset('assets/${this.images}', width: 80.0, height: 80.0,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
                  child: Text(this.title, style: TextStyle(fontSize: 22.0,)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
                  child: Text(this.location, style: TextStyle(fontSize: 18.0,)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
                  child: Text(timeAgo(dt), style: TextStyle(fontSize: 14.0,)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
                  child: new ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: double.infinity),
                    child: new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Apply This Job",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.grey), color: Colors.white),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.topLeft,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Job Description".toUpperCase(), style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse egestas est magna, at dictum dolor dictum porttitor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras nec sapien ac nisl rutrum sollicitudin. Suspendisse potenti. Pellentesque ultrices, ante sed sodales luctus, ligula odio euismod est, quis rutrum nibh lacus et sapien. Etiam non nulla mauris. Mauris eget iaculis nibh, id tincidunt diam. Cras commodo nisi at nisl suscipit, nec tincidunt nulla molestie. Etiam aliquet blandit ante quis gravida. Morbi blandit, sem ac pretium placerat, justo erat molestie urna, ac vehicula quam odio id sem. Etiam nec eleifend justo. Vestibulum in velit orci. Nulla tempus ut enim ut tempor. Phasellus sed ornare neque, vitae scelerisque ante. Aliquam porttitor nibh eget tempus pulvinar. Nulla aliquam semper sagittis. Fusce ac malesuada elit, nec iaculis nisi. Sed ut ipsum sollicitudin, pretium eros sed, laoreet turpis. Donec rutrum libero ac libero accumsan interdum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc eget libero vulputate, fermentum arcu nec, pharetra quam. Vivamus auctor maximus magna, eget consequat tellus condimentum vel. Etiam ultrices tortor metus, vitae porttitor nisi ornare feugiat. Ut euismod fermentum libero, non convallis dui mollis tristique. Donec pulvinar sagittis rutrum. Morbi viverra lorem magna, eget congue velit tincidunt non. Nulla tempus sollicitudin arcu nec iaculis. Phasellus vitae metus sit amet eros consequat condimentum. Maecenas egestas ex at felis sodales accumsan. Aliquam dignissim orci risus, sit amet sodales sem pretium eget. Nulla aliquam neque ac ipsum malesuada, eget dapibus mi facilisis. Cras vel eros velit. ", textAlign: TextAlign.justify, style: TextStyle(height: 1.5),),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
