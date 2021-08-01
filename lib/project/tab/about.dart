import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';

class About extends StatefulWidget {
  final String postid;

  About({Key key, this.postid}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  var long =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. AliquLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget d';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Post>(
        stream: DatabaseService().getPost(widget.postid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: attr(
                      'Future technology of GPS and Motion Sensors with easy tutorial explanations'),
                ),
                SizedBox(
                  height: 6,
                ),
                row('Project Done By : ', 'Someone'),
                SizedBox(
                  height: 6,
                ),
                row('Assistance : ', 'Henry Williams'),
                SizedBox(
                  height: 6,
                ),
                row('Studio : ', 'Explorica Labs and Research Center'),
                SizedBox(
                  height: 6,
                ),
                Text('Other Project Links :'),
                SizedBox(
                  height: 6,
                ),
                link('www.exploricaprojects/gps.com'),
                SizedBox(
                  height: 6,
                ),
                link('www.exploricaprojects/standardtechnologyongps.com'),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 150,
                  child: Text(
                    snapshot.data.bio,
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                a('Visit our company website'),
                SizedBox(
                  height: 5,
                ),
                link('www.company.com'),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget row(String g, String f) {
    return Row(
      children: [
        tex(g),
        SizedBox(
          height: 5,
        ),
        Text(f)
      ],
    );
  }

  Widget link(String link) {
    return Text(
      link,
      style: TextStyle(color: Colors.blue),
    );
  }

  Widget a(String link) {
    return Text(
      link,
      style: GoogleFonts.roboto(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
