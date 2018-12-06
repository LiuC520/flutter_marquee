# flutter_marquee

flutter 插件

flutter 跑马灯
可以指定跑马灯的方向
可以传入数组，可以是自定义的widget
可以控制跑马灯的时间间隔
控制点击事件等等



### 效果图
![flutter_marquee](/screenshot.gif)

#### 引入:

dependencies:
  flutter:
    sdk: flutter
  flutter_marquee:
    git: https://github.com/LiuC520/flutter_marquee.git

#### 属性

| Attribute 属性          | Description 描述 |
|:---				     |:---|
| children         | 自定义的widget组件数组 |
| texts         | 也可以传入 字符串数组 |
| seletedTextColor         | 当前显示text的颜色，只有texts有值才生效 |
| textColor         | 其他text的颜色，只有texts有值才生效 |
| duration         | 跑马灯的切换时长 默认是4秒 |
| itemDuration         | 单个item的动画出现或者退出时长 默认是500毫秒 |
| autoStart        | 是否自动开始动画 |
| animationDirection        | 动画显示的切换方式，默认是从上往下切换: AnimationDirection.l2r、AnimationDirection.r2l、AnimationDirection.t2b、AnimationDirection.b2t|
| animateDistance        | 移动的距离: 如果没有设置就是默认获取组件宽高，横向动画就是组建的宽度，纵向的就是组件的高度|
| singleLine        | 是否是单行显示: 默认是false|
| onChange        | 点击事件回调: 回调的参数是跑马灯的widget的下标|



# Example

1、首先在pubspec.yaml中添加依赖
```
dependencies:
  flutter:
    sdk: flutter
  flutter_marquee:
    git: https://github.com/flutter_marquee/flutter_marquee.git

```


```
    import 'package:flutter_marquee/flutter_marquee.dart';


          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("从下到上,时间间隔6秒，传入的是字符串数组"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        texts: ["刘成", "刘成1111", "刘成2222", "刘成3333"].toList(),
                        onChange: (i) {
                          print(i);
                        },
                        duration: 4),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从上到下,时间间隔8秒,传入的是自定义的text widget"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        children: <Widget>[
                          Text(
                            "刘成",
                            style: TextStyle(color: Colors.red),
                          ),
                          Text("刘成1111", style: TextStyle(color: Colors.green)),
                          Text("刘成2222", style: TextStyle(color: Colors.blue)),
                          Text("刘成3333",
                              style: TextStyle(color: Colors.yellow)),
                        ],
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.t2b,
                        duration: 8),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从左到右,时间间隔2秒,自定义的view"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        children: <Widget>[
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.menu),
                                Text(
                                  "刘成",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add),
                                Text(
                                  "刘成1111",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.satellite),
                                Text(
                                  "刘成2222",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.format_align_justify),
                                Text("刘成3333",
                                    style: TextStyle(color: Colors.yellow)),
                              ],
                            ),
                          ),
                        ],
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.l2r,
                        duration: 2),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("从右到左,时间间隔6秒"),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FlutterMarquee(
                        texts: ["刘成", "刘成1111", "刘成2222", "刘成3333"].toList(),
                        onChange: (i) {
                          print(i);
                        },
                        animationDirection: AnimationDirection.r2l,
                        duration: 6),
                  )
                ],
              ),

```
