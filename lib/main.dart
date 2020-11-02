import 'package:bloc_pattern/bloc/counter_bloc.dart';
import 'package:bloc_pattern/bloc/counter_events.dart';
import 'package:bloc_pattern/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modi Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Bloc Counter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({this.title, Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(CounterState(counter: 0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bloc Counter:',
              ),
              BlocBuilder<CounterBloc,CounterState>(
                   builder: (BuildContext context, CounterState state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
               }
               ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context){
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: ()=>_emitNewEvent(context,CounterEvents.INCREASE),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: ()=>_emitNewEvent(context,CounterEvents.RESET),
                  tooltip: 'Reset',
                  child: Icon(Icons.loop),
                ),
                FloatingActionButton(
                  onPressed: ()=>_emitNewEvent(context , CounterEvents.DECREASE),
                  tooltip: 'Decrease',
                  child: Icon(Icons.remove),
                ),
              ],
            );
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void _emitNewEvent(BuildContext context,CounterEvents newState) {
    context.bloc<CounterBloc>().add(newState);
  }
}
