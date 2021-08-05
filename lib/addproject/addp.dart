import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/addproject/cartgory.dart';
import 'package:skillshark/addproject/content.dart';
import 'package:skillshark/addproject/document.dart';
import 'package:skillshark/addproject/poblish.dart';
import 'package:skillshark/controller/pagecon.dart';

class Ap extends StatefulWidget {
  final String postid;

  Ap({Key key, this.postid}) : super(key: key);

  @override
  _AddPState createState() => _AddPState();
}

class _AddPState extends State<Ap> {
  int index = 0;
  Size size;
  Pagecontrol pp;
  final contentformKey = GlobalKey<ContentState>();
  final docformKey = GlobalKey<DocState>();
  final cartformKey = GlobalKey<CartState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    pp = Provider.of<Pagecontrol>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    pp.setadd(0);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Project',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Stepper(
                            type: StepperType.horizontal,
                            physics: BouncingScrollPhysics(),
                            currentStep: index,
                            onStepCancel: () {
                              if (index > 0) {
                                setState(() {
                                  index = index - 1;
                                });
                              }
                            },
                            onStepContinue: () {
                              if (index < 3) {
                                setState(() {
                                  index = index + 1;
                                  switch (index - 1) {
                                    case 0:
                                      contentformKey.currentState.submit();
                                      break;
                                    case 1:
                                      docformKey.currentState.submit();
                                      break;
                                    case 2:
                                      cartformKey.currentState.submit();
                                      break;
                                    default:
                                      print('nope');
                                      break;
                                  }
                                });
                              }
                            },
                            onStepTapped: (i) {
                              setState(() {
                                index = i;
                              });
                            },
                            steps: [
                              Step(
                                  title: Text('Content'),
                                  content: Container(
                                    height: 1050,
                                    width: size.width,
                                    child: Content(
                                      key: contentformKey,
                                      postid: widget.postid,
                                    ),
                                  ),
                                  isActive: index == 0 ? true : false),
                              Step(
                                  title: Text('Documentary'),
                                  content: Container(
                                    height: size.height - 300,
                                    width: size.width,
                                    child: Doc(
                                      key: docformKey,
                                      postid: widget.postid,
                                    ),
                                  ),
                                  isActive: index == 1 ? true : false),
                              Step(
                                  title: Text('Category'),
                                  content: Container(
                                    height: size.height,
                                    width: size.width,
                                    child: Cart(
                                      key: cartformKey,
                                      postid: widget.postid,
                                    ),
                                  ),
                                  isActive: index == 2 ? true : false),
                              Step(
                                  title: Text('Publish'),
                                  content: Container(
                                    height: size.height - 300,
                                    width: size.width,
                                    child: Publish(),
                                  ),
                                  isActive: index == 3 ? true : false),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
