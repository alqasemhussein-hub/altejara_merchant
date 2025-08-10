import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/enums/general.dart';

class StateLoader extends StatelessWidget {
  final RemoteDataState state;
  final Widget child;
  final Function() onReload;

  const StateLoader({
    Key? key,
    required this.state,
    required this.child,
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return state == RemoteDataState.loading
        ? Center(child: CircularProgressIndicator())
        : state == RemoteDataState.loaded
        ? child
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'حدث خطأ أثناء تحميل البيانات',
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    onReload();
                  },
                  label: Text('إعادة المحاولة'),
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          );
  }
}
