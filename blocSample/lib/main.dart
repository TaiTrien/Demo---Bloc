import 'package:blocSample/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
        ],
        child: MaterialApp(
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test bloc'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('counter:'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('${state.counter}');
              },
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              child: Text('them'),
              onPressed: () {
                print('${_counterBloc.state.counter}');
                _counterBloc.add(
                  IncreasingCounter(_counterBloc.state.counter),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
