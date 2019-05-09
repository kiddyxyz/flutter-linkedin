import 'package:flutter/material.dart';
import 'package:linkedin_flutter/job_detail_screen.dart';
import 'package:timeago/timeago.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: new Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Image.asset('assets/linkedin_logo.png', width: 70.0, height: 30.0,),
        ),
        title: new Text("Job List"),
        backgroundColor: Color.fromRGBO(0, 46, 71, 100.0),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new UserWidget(
            title: jobs[index]['title'],
            images: jobs[index]['images'],
            company: jobs[index]['company'],
            location: jobs[index]['location'],
            timestamp: jobs[index]['timestamp'],
          );
        },
        itemCount: jobs.length,
      ),
    );
  }

  List jobs = [
    {
      "title": "Senior Accountant",
      "images": "lyft.png",
      "company": "Lyft",
      "location": "San Fransisco, CA, US",
      "timestamp": "2019-05-06 12:12"
    },
    {
      "title": "Backend Developer",
      "images": "tell.png",
      "company": "Tell",
      "location": "Jakarta, IDN",
      "timestamp": "2019-05-01 12:12"
    },
  ];
}


class UserWidget extends StatelessWidget {
  final String title, company, images, location, timestamp;
  const UserWidget({Key key, this.title, this.images, this.company, this.location, this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.parse(this.timestamp);

    return new Container(
        padding: new EdgeInsets.only(top: 10.0, right: 5.0,left: 5.0),
        margin: new EdgeInsets.symmetric(vertical: 1.0),
        child:
        ListTile(
          leading:
          new Container(
            child: Image.asset('assets/' + this.images, width: 55.00, height: 100.0,),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(this.title.toUpperCase(), style: TextStyle(color: Colors.blue),),
          ),
          subtitle: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(this.company, style: TextStyle(color: Colors.black, fontSize: 18.0)),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(this.location, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(timeAgo(dt), style: TextStyle(color: Colors.black, fontSize: 15.0)),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobDetail(this.title,
                  this.images, this.company, this.location, this.timestamp
              )),
            );
          },
        )
    );
  }
}