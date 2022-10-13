import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;
  int counter_1=0;
  int counter_2=0;
  int counter_3=0;
  void c1(){
    setState(() {
      counter_1=counter_1+1;
    });
  }
  void c2(){
    setState(() {
      counter_2=counter_2+1;
    });
  }
  void c3(){
    setState(() {
      counter_3=counter_3+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Wrap(direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(onPressed: (){
                if(currentPageIndex==0)
                  c1();
                if(currentPageIndex==1)
                  c2();
                if(currentPageIndex==2)
                  c3();
              },child: Icon(Icons.add),),
            ),

            Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(onPressed: (){
                if(currentPageIndex==0)
                  setState(() {
                    counter_1=0;
                  });
                if(currentPageIndex==1)
                  setState(() {
                    counter_2=0;
                  });
                if(currentPageIndex==2)
                  setState(() {
                    counter_3=0;
                  });

              },backgroundColor: Colors.red,child: Text('Reset'),),
            )


          ],

        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Counter- 1',
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Counter- 2',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add),
              icon: Icon(Icons.add),
              label: 'Counter- 3',
            ),
          ],
        ),
        body: <Widget>[
          Container(

            alignment: Alignment.center,
            child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              Text('Counter - 1 ',style: TextStyle(fontSize: 35),),
              Center(child: Text('$counter_1',style: TextStyle(fontSize: 20),)),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.blueAccent,textStyle: const TextStyle(fontSize: 20)),onPressed: c1, child: Text(' Increment me'))
            ],),
          ),
          Container(

            alignment: Alignment.center,
            child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              Text('Counter - 2 ',style: TextStyle(fontSize: 35),),
              Center(child: Text('$counter_2',style: TextStyle(fontSize: 20),)),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.blueAccent,textStyle: const TextStyle(fontSize: 20)),onPressed: c2, child: Text(' Increment me')),
            ],),
          ),
          Container(

            alignment: Alignment.center,
            child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              Text('Counter - 3 ',style: TextStyle(fontSize: 35),),
              Center(child: Text('$counter_3',style: TextStyle(fontSize: 20),)),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.blueAccent,textStyle: const TextStyle(fontSize: 20)),onPressed: c3, child: Text(' Increment me')),
            ],),
          ),
        ][currentPageIndex],


      ),

    );

  }
}





