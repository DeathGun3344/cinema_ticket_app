import 'package:cinema_ticket_app/models/Seat.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {

  static const routeName = '/seat';

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {

  List<int> selected = [35, 36, 37];
  List<Map> seats = [
    {
      'align': MainAxisAlignment.end,
      'seats': [
        [Seat(id: 1),Seat(id: 2),Seat(id: 3),],
        [Seat(id: 4),Seat(id: 5),Seat(id: 6),Seat(id: 7),],
        [Seat(id: 8),Seat(id: 9),Seat(id: 10),Seat(id: 11),],
        [Seat(id: 12),Seat(id: 13),Seat(id: 14, isAvailable: false),Seat(id: 15, isAvailable: false),],
        [Seat(id: 16),Seat(id: 17),Seat(id: 18),Seat(id: 19),],
        [Seat(id: 20),Seat(id: 21),Seat(id: 22),Seat(id: 23),],
        [Seat(id: 52),Seat(id: 53),Seat(id: 54),Seat(id: 55),],
        [Seat(id: 24),Seat(id: 25),Seat(id: 26)],
      ]
    },
    {
      'align': MainAxisAlignment.start,
      'seats': [
        [Seat(id: 27),Seat(id: 28),Seat(id: 29),],
        [Seat(id: 30),Seat(id: 31),Seat(id: 32),Seat(id: 33),],
        [Seat(id: 34),Seat(id: 35),Seat(id: 36),Seat(id: 37),],
        [Seat(id: 38),Seat(id: 39),Seat(id: 40),Seat(id: 41),],
        [Seat(id: 16),Seat(id: 42, isAvailable: false),Seat(id: 43),Seat(id: 44),],
        [Seat(id: 45),Seat(id: 46, isAvailable: false),Seat(id: 47, isAvailable: false),Seat(id: 48, isAvailable: false),],
        [Seat(id: 56),Seat(id: 57),Seat(id: 58),Seat(id: 59)],
        [Seat(id: 49),Seat(id: 50),Seat(id: 51)],
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3544C5),
      appBar: AppBar(
        title: Text('Choose Seats'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  Expanded(
                      child: Container()
                  ),
                  Expanded(
                    flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            for(int i = 0; i < seats.length; i++)
                              ...[Expanded(child: genSeats(axis: seats[i]['align'], lSeats: seats[i]['seats']), flex: 3, ),
                                Expanded(child: Container()),],
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          option(label: 'Selected', color: Color(0xFF03D3D3)),
                          option(label: 'Reserved', color: Color(0xFF635ACA)),
                          option(label: 'Available'),
                        ],
                      )
                  ),
                ],
              )
          ),
          Expanded(
            flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 50),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFF0D0846),),
                          SizedBox(width: 10,),
                          Text('Rooftop Film Club', style: Theme.of(context).textTheme.bodyText2,)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        card(title: 'Date', value: '26.01'),
                        card(title: 'Hour', value: '20:40', active: true),
                        card(title: 'Seats', value: '7,8'),
                        card(title: 'Row', value: '5'),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price'),
                                Text('\$47,50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )),
                          Expanded(
                            child: RaisedButton(
                              color: Color(0xFF0D0846),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                                ),
                                onPressed: () => null,
                              child: Container(
                                height: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Buy', style: TextStyle(color: Colors.white, fontSize: 20)),
                                    SizedBox(width: 20,),
                                    Icon(Icons.arrow_forward, color: Colors.white,)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget genSeats({@required MainAxisAlignment axis, @required List<List<Seat>> lSeats}) {
    return Column(
      children: [
        ...lSeats.map(
                (s) {
                  List<Widget> ss = [];
                  for(int i = 0; i < s.length; i++) {
                    ss.add(seat(s[i]));
                  }
                  return Row(
                    mainAxisAlignment: axis,
                    children: [...ss],
                  );
                }
        ).toList(),
      ],
    );
  }

  Widget seat(Seat seat) {
    Color color = Colors.transparent;
    Color border = Colors.white;

    if(!seat.isAvailable) {
      color =  Color(0xFF635ACA);
      border = Colors.transparent;
    } else if(selected.contains(seat.id)) {
      color =  Color(0xFF03D3D3);
      border = Colors.transparent;
    }

    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: border
        ),
        color: color
      ),
    );
  }

  Widget option({@required String label, Color color}) {

    Color border = color;

    if(color == null) {
      border = Colors.white;
      color = Colors.transparent;
    }

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: border
            )
          ),
        ),
        SizedBox(width: 5,),
        Text(label, style: TextStyle(color: Colors.white),)
      ],
    );
  }

  Widget card({@required String title, @required String value, bool active: false}) {
    return Container(
      width: 70,
      height: 90,
      decoration: BoxDecoration(
        color: active ? Color(0xFFE9EBFC) : Colors.transparent,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.bodyText1,),
          Text(title, style: Theme.of(context).textTheme.bodyText2,),
        ],
      ),
    );
  }
}
