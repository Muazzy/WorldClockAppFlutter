import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //recieving the data and storing it in the data var
    //map to use it latter on
    //here we are using the ternary operator build a logic
    //the logic is basically quite simple if the data map is not empty
    //meaning that we have choose a location and that data is passed on so we
    //just push that data into data map lol if that makes sense or
    //if the data map is empty meaning that we havent selected any location then itll
    //run that other command basically get the data on its own.
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set the background image
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            //this property will make sure that the image covers whole screen etc
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      /*handeled this error by myself
                        this error was basically that if we dont choose any country
                        and go back to home screen anyway so it would have given a error
                        cuz the values are null so... thats that.
                        you can also do it that way
                           if(result!=null){
                             data = {
                              'time': result['time'],
                              'flag': result['flag'],
                              'location': result['location'],
                              'isDayTime': result['isDayTime'],
                        };
                      }*/
                      //handling error
                      if (result == null) {
                        return;
                      } else {
                        data = {
                          'time': result['time'],
                          'flag': result['flag'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                        };
                      }
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //location
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                //time
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 69,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
