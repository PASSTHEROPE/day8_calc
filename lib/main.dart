import 'package:day8/countercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// void main() => runApp(CounterApp());
//
// class CounterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => CounterCubit(),
//         child: CounterPage(),
//       ),
//     );
//   }
// }
//
//
// class CounterPage extends StatelessWidget {
//   get cubit => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterCubit, int>(
//         bloc: cubit,
//         builder: (context, count) => Center(child: Text('$count')),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => context.read<CounterCubit>().increment(),
//           ),
//           const SizedBox(height: 4),
//           // FloatingActionButton(
//           //   child: const Icon(Icons.remove),
//           //   onPressed: () => context.read<CounterCubit>().decrement(),
//           // ),
//         ],
//       ),
//     );
//   }
// }



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Counter",
        theme: ThemeData.light(),
        home: BlocProvider(
            create: (context) => CounterCubit(), child: const HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  late CounterCubit cubit;

  @override
  void didChangeDependencies() {
// TODO: implement didChangeDependencies
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Counter")),
      ),
// body: BlocConsumer<CounterCubit, int>(
// bloc: cubit,
// listener: (context, state) {
// const snackbar = SnackBar(content: Text("State is reached"));

// if (state == 5) {
// ScaffoldMessenger.of(context).showSnackBar(snackbar);
// }
// },
    body: BlocConsumer<CounterCubit, int>(
        bloc: cubit,
        listener: ((context, state) {
          const snackbar = SnackBar(
            content: Text('State is reached'),
          );

          if (state == 10) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        }
    ),

    builder: (context, state) {
    return Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "$state",
    style: TextStyle(fontSize: 30),
    ),
    ElevatedButton(
    onPressed: () {
    cubit.increment();
    },
    child: const Text("Increment")),

      ElevatedButton(
          onPressed: () {
            cubit.decrement();
          },
          child: const Text("Decrement")),

      ElevatedButton(
          onPressed: () {
            cubit.reset();
          },
          child: const Text("ressets")),

      ElevatedButton(
          onPressed: () {
            cubit.multiply();
          },
          child: const Text("X")),

      ElevatedButton(
          onPressed: () {
            cubit.division();
          },
          child: const Text("/")),

     TextField(
    decoration:  InputDecoration(labelText: "Enter your number"),
      keyboardType: TextInputType.number,
      // Only numbers can be entered

     ),
    ],
    ),
    );
    },

      // body: BlocListener<CounterCubit, int>(
      //   bloc: cubit,
      //   listener: ((context, state) {
      //     const snackbar = SnackBar(
      //       content: Text('State is reached'),
      //     );
      //
      //     if (state == 10) {
      //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //     }
      //   }
      //   ),
      //   child: BlocBuilder<CounterCubit, int>(
      //     bloc: cubit,
      //     builder: (context, state) {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               "$state",
      //               style: TextStyle(fontSize: 30),
      //             ),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   cubit.increment();
      //                 },
      //                 child: const Text("Increment"))
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ),
    ),
    );
  }
}
