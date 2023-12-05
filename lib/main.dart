import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MethodChannel _channel =
      const MethodChannel("com.example.native_connection_study");

  String _resultData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Method Channel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_resultData),
            const SizedBox(height: 32.0),
            ElevatedButton(
              // 메소드 채널의 결과는 Future타입으로 반환되므로 async 키워드를 이용한다.
              onPressed: () async {
                // 메소드 채널을 호출할 때는 invokeMethod를 통해 호출한다.
                // getNativeData의 이름으로 된 함수를 실행시키는데 ["Raon", "29"]의 arguments를 넘겨준다.
                final result = await _channel
                    .invokeMethod("getNativeData", ["Raon", "29"]);

                setState(() {
                  _resultData = result.toString();
                });
              },
              child: const Text("Call Native Method"),
            ),
          ],
        ),
      ),
    );
  }
}
