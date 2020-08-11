import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdouban/feature/datashare/share_data_viewmodel.dart';

class SharePageContent12 extends StatelessWidget {
  @override

  final s = [_MYBtnConsumer(),_MYBtnSelector()];

  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text('${context.watch<HYCounterViewModel>().user.username}'),
        ...s,
      ],
    );
    
  }
}




class _MYBtnConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("this is MYbtn build");

    return Consumer<HYCounterViewModel>(
      builder: (ctx, vm, child) {
        return FlatButton(
          child: child,
          onPressed: () {
            final user = vm.user;
            final newuser = User();
            newuser.username = (user.username ?? '') + 'a';
            newuser.age = user.age;
            vm.user = newuser;
          },
        );
      },

      child: Text('_MYBtnConsumer'),
    );
  }
}


class _MYBtnSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("this is _MYBtnSelector build");

    return Selector<HYCounterViewModel, HYCounterViewModel>(
      selector: (ctx, vm) {
        return vm;
      },
      shouldRebuild: (prev, next) {
        return false;
      },
      builder: (ctx,vm,child) {
        print("this is this is _MYBtnSelector realbuild");
        return FlatButton(
          child: Text('_MYBtnSelector'),
          onPressed: () {
            final user = vm.user;
            final newuser = User();
            newuser.username = (user.username ?? '') + 'a';
            newuser.age = user.age;
            vm.user = newuser;
          },
        );
      },

    );

  }
}