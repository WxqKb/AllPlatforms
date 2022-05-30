import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../router/routes.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appName'.tr),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(Icons.close),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<HomeLogic>(builder: (logic) {
              return Text(
                '${state.count}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConfig.upgrade);
              },
              child: const Text('跳转'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
