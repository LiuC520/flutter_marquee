import 'package:flutter/material.dart';
import 'dart:async'; //Timer
import './flutter_marquee_item.dart';
import './animation_direction.dart';

typedef Widget WidgetMaker<T>(BuildContext context, T item);

class FlutterMarquee extends StatefulWidget {
  /// 跑马灯的具体类容
  final List<Widget> children;

  ///  text 的具体内容
  final List<String> texts;

  /// 当前正在跑的文字的颜色
  /// 只在texts有值时生效
  final Color seletedTextColor;

  /// 正常的文字颜色
  /// 只在texts有值时生效
  final Color textColor;

  /// 跑马灯的切换时长 默认是4秒
  final int duration;

  /// 跑马灯的切换时长 默认是500毫秒
  final int itemDuration;

  ///是否自动开始
  final bool autoStart;

  ///动画显示的切换方式，默认是从上往下切换
  final AnimationDirection animationDirection;

  ///移动的距离
  ///如果没有设置就是默认获取组件宽高，横向动画就是组建的宽度，纵向的就是组件的高度
  final double animateDistance;

  ///是否是单行显示
  final bool singleLine;

  ///点击事件回调
  ValueChanged<int> onChange;

  FlutterMarquee(
      {this.children,
      this.texts,
      Color seletedTextColor,
      Color textColor,
      int duration,
      double itemDuration,
      bool autoStart,
      AnimationDirection animationDirection,
      this.animateDistance,
      this.onChange,
      bool singleLine})
      : assert(children != null || texts != null),
        assert(onChange != null),
        this.duration = duration ?? 4,
        this.itemDuration = itemDuration ?? 500,
        this.autoStart = autoStart ?? true,
        this.singleLine = singleLine ?? true,
        this.textColor = textColor ?? Colors.black,
        this.seletedTextColor = seletedTextColor ?? Colors.black,
        this.animationDirection = animationDirection ?? AnimationDirection.b2t;

  @override
  State<StatefulWidget> createState() {
    return _FlutterMarquee();
  }
}

class _FlutterMarquee extends State<FlutterMarquee> {
  Timer _timer; // 定时器timer
  int currentPage = 0;
  bool lastPage = false;
  List<FlutterMarqueeItem> items = <FlutterMarqueeItem>[];
  FlutterMarqueeItem firstItem;
  FlutterMarqueeItem secondItem;
  @override
  void initState() {
    super.initState();
    if (widget.texts != null) {
      for (var i = 0; i < widget.texts.length; i++) {
        items.add(new FlutterMarqueeItem(
          child: Text(
            widget.texts[i],
          ),
          // text: widget.texts[i],
          onPress: () {
            widget.onChange(i);
          },
          singleLine: widget.singleLine,
          animationDirection: widget.animationDirection,
          animateDistance: widget.animateDistance,
          itemDuration: widget.itemDuration,
        ));
      }
    } else {
      for (var i = 0; i < widget.children.length; i++) {
        items.add(new FlutterMarqueeItem(
          child: widget.children[i],
          // text: widget.texts[i],
          onPress: () {
            widget.onChange(i);
          },
          singleLine: widget.singleLine,
          animationDirection: widget.animationDirection,
          animateDistance: widget.animateDistance,
          itemDuration: widget.itemDuration,
        ));
      }
    }

    firstItem = items[0];

    // if (widget.datas != null && widget.datas.length == 1) {}
    // if (widget.datas != null && widget.datas.length == 1 ||
    // widget.texts.length == 1) {}
    if (widget.autoStart) {
      _timer = Timer.periodic(Duration(seconds: widget.duration), (timer) {
        this.setState(() {
          currentPage++;
          if (currentPage >= items.length) {
            //last item
            currentPage = 0;
            firstItem = items[items.length - 1]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          } else if (currentPage <= 0) {
            // first item
            currentPage = items.length - 1;
            firstItem = items[0]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          } else {
            firstItem = items[currentPage - 1]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ///设置动画的宽度或者高度
    if (widget.animateDistance == null) {
      if (widget.animationDirection == AnimationDirection.l2r ||
          widget.animationDirection == AnimationDirection.l2r) {
        double width = MediaQuery.of(context).size.width;
        firstItem.animateDistance = width;
        if (secondItem != null) {
          secondItem.animateDistance = width;
        }
      } else {
        double height = MediaQuery.of(context).size.height;
        firstItem.animateDistance = height;
        if (secondItem != null) {
          secondItem.animateDistance = height;
        }
      }
    }
    List<FlutterMarqueeItem> items = secondItem == null
        ? <FlutterMarqueeItem>[firstItem..textColor = widget.seletedTextColor]
        : <FlutterMarqueeItem>[
            secondItem..textColor = widget.seletedTextColor,
            firstItem..textColor = widget.textColor
          ];

    return ClipRect(
        child: Center(
      child: Stack(
        children: items,
      ),
    ));
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
}
