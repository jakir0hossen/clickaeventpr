
import 'package:flutter/material.dart';

import '../widgets/bodyBackground.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Event",style: TextStyle(color: Colors.white),),
      centerTitle: true,),
      backgroundColor: Colors.white,
      body: BodyBackground(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 0.0),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 60.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text('Hey, Jakir!',)),
                        SizedBox(height: 12.0,),
                        Center(child: Text("All Event", )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5
                            )],
                            color: Colors.redAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/party-popper.png',
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                                //SizedBox(height: 12.0,),
                                Text('All Events',style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 24.0,),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5
                            )],
                            color: Colors.redAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/emoji.png',
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                                //SizedBox(height: 12.0,),
                                Text('Birthday',style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 24.0,),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.redAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/wedding.png',
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                                //SizedBox(height: 12.0,),
                                Text('Wedding',style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 24.0,),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.redAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/anniversary.png',
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                                //SizedBox(height: 12.0,),
                                Text('Anniversary',style: TextStyle(color:Colors.white),
                                  textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 35.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Upcoming events',),
                        Text('01/10', ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.0,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 140.0,
                          width: 260.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/brithday.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black87.withOpacity(0.4), BlendMode.darken)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 10.0,
                                    ),
                                    SizedBox(width: 4.0,),
                                    Text('February 20, 2024',style: TextStyle(color: Colors.white), )
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Text('Minhaj Community Center',style: TextStyle(color: Colors.white),),
                                SizedBox(height: 4.0,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 18.0,),
                        Container(
                          height: 140.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/wedding1.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 10.0,
                                    ),
                                    SizedBox(width: 4.0,),
                                    Text('February 26, 2024',style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Text('Pallabi Community Center',style: TextStyle(color: Colors.white),),
                                SizedBox(height: 4.0,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 18.0,),
                        Container(
                          height: 140.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/anniversary.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 10.0,
                                    ),
                                    SizedBox(width: 4.0,),
                                    Text('February 26, 2024',style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Text('Pallabi Community Center',style: TextStyle(color: Colors.white),),
                                SizedBox(height: 4.0,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Your location',),
                      SizedBox(height: 18.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 110.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/location.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.75), BlendMode.darken),
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('\u00b0',)
                              ],
                            ),
                          ),
                          SizedBox(width: 18.0,),
                          Container(
                            height: 110.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/location1.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.75), BlendMode.darken),
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('\u00b0',)
                              ],
                            ),
                          ),
        
        
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
