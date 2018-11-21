import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ProgressWidget = Widget Function();

class FutureProgress<T> extends StatelessWidget{

  final AsyncWidgetBuilder<T> onSuccess;
  final AsyncWidgetBuilder<T> onFailure;
  final ProgressWidget onProgress;
  final Future<T> future;

  const FutureProgress({
    Key key, this.onSuccess,
    this.onFailure,
    this.future,
    this.onProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onSuccess(context,snapshot);
        } else if (snapshot.hasError) {
          return onFailure(context,snapshot);
        }
        // By default, show a loading spinner
        if(onProgress != null){
          return onProgress();
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }

}