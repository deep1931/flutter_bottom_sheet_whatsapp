import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withAlpha(3),
      appBar: AppBar(
        title: Text('Whats App Like Bottom Sheet'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await showRevealDialog(context);
          },
          color: Colors.red,
          child: Text(
            'Show Me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> showRevealDialog(BuildContext context) async {
    Animation<double> _animation = new Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      //barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(top: 30),
            height: 250,
            child: CircularRevealAnimation(
              animation: _animation,
              centerAlignment: Alignment.bottomRight,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.insert_drive_file,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Document',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black45),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black45),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.category,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Gallery',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black45))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.audiotrack,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Audio',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black45),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black45),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.contacts,
                                    color: Colors.black38,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Contact',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black45))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return CircularRevealAnimation(
          child: child,
          animation: anim1,
          centerAlignment: Alignment.bottomRight,
        );
      },
    );
  }
}
