import 'package:flutter/material.dart';
import 'pages/Login.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(new MaterialApp(
    title: 'SUSTech Market',
    home: new MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int tabIndex = 0;
  var bodies = [new HomePage(), new NeighborPage(), new MessagePage()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.error_outline),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) {
                  //指定跳转的页面
                  return new LoginPage();
                },
              ));
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: HomeBuilder.homeDrawer(),
      ),
      body: bodies[tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                '主页',
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            title: Text(
              '附近',
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              title: Text(
                '消息',
              )),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
      ),
      floatingActionButton: HomeBuilder.homeFloatingButton(),
    );
  }
}

class NeighborPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return new InnerRow(
            child: new NeighborCard(
              accountPicture: "",
              name: "UserName",
              description: "Description here "
                  "",
              image1: "images/LOGO/1.5x/logo_hdpi.png",
              image2: "images/LOGO/1.5x/logo_hdpi.png",
              image3: "images/LOGO/1.5x/logo_hdpi.png",
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}

class NeighborCard extends StatefulWidget {
  const NeighborCard({
    Key key,
    this.child,
    this.name,
    this.accountPicture,
    this.description,
    this.image1,
    this.image2,
    this.image3,
  }) : super(key: key);
  final Widget child;
  final String image1;
  final String image2;
  final String image3;
  final String name;
  final String description;
  final String accountPicture;

  @override
  _NeighborCard createState() => new _NeighborCard();
}

//商品卡
class _NeighborCard extends State<NeighborCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: new Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        color: Colors.blue),
                    width: 50.0,
                    height: 50.0,
                    child: new Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    )),
              ),
              new Text(
                widget.name,
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          new Divider(),
          new Align(
            alignment: Alignment.centerLeft,
            child: new Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: new Text(
                widget.description,
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          new Divider(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Expanded(
                  child: new Container(
                width: 72.0,
                height: 72.0,
                child: new Image.asset(widget.image1),
              )),
              new Expanded(
                  child: new Container(
                width: 72.0,
                height: 72.0,
                child: new Image.asset(widget.image2),
              )),
              new Expanded(
                  child: new Container(
                width: 72.0,
                height: 72.0,
                child: new Image.asset(widget.image3),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        return new InnerRow(
          child: new Card(
            child: new ListTile(
              title: new Text("UserName"),
              subtitle: new Text("Message Content"),
              //之前显示icon
              leading: new Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      color: Colors.blue),
                  width: 50.0,
                  height: 50.0,
                  child: new Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),),
              trailing: new Text("18:18",style: new TextStyle(color: Colors.grey),),
              //之后显示checkBox
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new InnerRow(
              child: new CarouselSlider(
                  items: [1, 2, 3, 4, 5].map((i) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.blue),
                            child: new Text(
                              'text $i',
                              style: new TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                  height: 150.0,
                  autoPlay: true),
            ),
            new InnerRow(
              child: new Card(
                  elevation: 2.0,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                          new InnerButton(
                            text: new Text("类别"),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
//            new ListView.builder(itemBuilder: (context, index) {
//              return new InnerRow(child: new ItemRow(),);
//            },
//              itemCount: 20,),
            new Divider(),
            new InnerRow(
              child: new ItemRow(),
            ),
            new InnerRow(
              child: new ItemRow(),
            ),
            new InnerRow(
              child: new ItemRow(),
            ),
            new InnerRow(
              child: new ItemRow(),
            ),
            new InnerRow(
              child: new ItemRow(),
            ),
            new InnerRow(
              child: new ItemRow(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBuilder {
  //浮动按钮
  static Widget homeFloatingButton() {
    return new FloatingActionButton(
      child: new Icon(Icons.add),
      elevation: 7.0,
      highlightElevation: 14.0,
      onPressed: () {},
    );
  }

  //侧边栏
  static Widget homeDrawer() {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      new UserAccountsDrawerHeader(
        currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage("images/LOGO/4x/logo_xxxhdpi.jpg")),
        accountName: new Text(
          "UserName",
        ),
        accountEmail: new Text(
          "UserEmail@example.com",
        ),
        onDetailsPressed: () {},
      ),
      new ClipRect(
        child: new ListTile(
          leading:
              new CircleAvatar(child: new Icon(Icons.perm_contact_calendar)),
          title: new Text('我的信息'),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Icon(Icons.add_shopping_cart)),
        title: new Text('我的交易'),
        subtitle: new Text("我买的和我卖的"),
        onTap: () => {},
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Icon(Icons.settings)),
        title: new Text('设置'),
        onTap: () => {},
      ),
      new AboutListTile(
        icon: new CircleAvatar(child: new Text("Ab")),
        child: new Text("关于"),
        applicationName: "Test",
        applicationVersion: "1.0",
        applicationLegalese: "applicationLegalese",
        aboutBoxChildren: <Widget>[
          new Text("BoxChildren"),
          new Text("box child 2")
        ],
      ),
    ]);
  }
}

//内部空间中行设定
class InnerRow extends StatefulWidget {
  const InnerRow({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child; //分类ICON

  @override
  _InnerRowState createState() => new _InnerRowState();
}

class _InnerRowState extends State<InnerRow> {
  double _leftMargin = 0.0;
  double _topMargin = 10.0;
  double _rightMargin = 0.0;
  double _bottomMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: new Container(),
            flex: 1,
          ),
          new Expanded(
            child: widget.child,
            flex: 30,
          ),
          new Expanded(
            child: new Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

//内部分类圆形控件
class InnerButton extends StatefulWidget {
  const InnerButton({Key key, this.child, this.text}) : super(key: key);
  final Widget child;
  final Widget text;

  @override
  _InnerButtonState createState() => new _InnerButtonState();
}

class _InnerButtonState extends State<InnerButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton(
          shape: CircleBorder(),
          color: Colors.blue,
          onPressed: () {},
          child: new Container(),
        ),
        widget.text
      ],
    );
  }
}

class ItemCard extends StatefulWidget {
  const ItemCard({
    Key key,
    this.child,
    this.image,
    this.title,
    this.price,
  }) : super(key: key);
  final Widget child;
  final String image;
  final String title;
  final String price;

  @override
  _ItemCardState createState() => new _ItemCardState();
}

//商品卡
class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      elevation: 2.0,
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Container(
//                      color: Colors.black12,
              child: new Image.asset(widget.image),
            ),
            flex: 4,
          ),
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Text(
                widget.title,
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            flex: 1,
          ),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              alignment: Alignment.center,
              child: new Text("￥" + widget.price,
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

//商品行
class ItemRow extends StatefulWidget {
  const ItemRow({
    Key key,
    this.child,
  }) : super(key: key);
  final Widget child;

  @override
  _ItemRowState createState() => new _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 220.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new ItemCard(
              image: "images/LOGO/1.5x/logo_hdpi.png",
              title: "itemNammmmmmmmmmmmmmmmmmmme",
              price: "888888",
            ),
            flex: 1,
          ),
          new Expanded(
            child: new ItemCard(
              image: "images/LOGO/1.5x/logo_hdpi.png",
              title: "itemNammmmmmmmmmmmmmmmme",
              price: "888888",
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
