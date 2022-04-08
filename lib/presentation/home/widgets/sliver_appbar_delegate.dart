import 'package:flutter/widgets.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._widget, {double? minExtent, double? maxExtent})
      : _minExtent = minExtent ?? 0,
        _maxExtent = maxExtent ?? 100;

  final Widget _widget;

  final double _minExtent;
  final double _maxExtent;
  @override
  double get minExtent => _minExtent;
  @override
  double get maxExtent => _maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _widget;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
    // return _widget != oldDelegate._widget ||
    //     _minExtent != oldDelegate._minExtent ||
    //     _maxExtent != oldDelegate._maxExtent;
  }
}
