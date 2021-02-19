import 'package:flutter/material.dart';

class ScrollingNavbar extends StatefulWidget {
  final List<Widget> children;
  final AppBar appBar;

  final List<String> headings;

  ScrollingNavbar({
    this.children = const <Widget>[],
    @required this.appBar,
    this.headings = const <String>[],
  }) : assert(children != null);

  @override
  _ScrollingNavbarState createState() => _ScrollingNavbarState();
}

class _ScrollingNavbarState extends State<ScrollingNavbar> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // add listener on the page view
    _controller.addListener(_scrollListener);
    super.initState();
  }

  //Printing the pozish
  _scrollListener() {
    // final _scrollPozish = _controller.position.pixels;
    // print(_scrollPozish);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateTo(int index) {
    // use this to animate to the page
    _controller.animateToPage(
      index,
      curve: Curves.easeOutQuart,
      duration: Duration(seconds: 1),
    );

    // // or this to jump to it without animating
    // _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    AppBar out = AppBar(
        title: widget.headings.isEmpty
            ? Row(
                children: [
                  ...widget.children.map(
                    (title) {
                      var index = widget.children.indexOf(title);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () => navigateTo(index),
                            child: Text(widget.children[index].toString(),
                                style: widget.appBar.titleTextStyle)),
                      );
                    },
                  )
                ],
              )
            : Row(
                children: [
                  ...widget.headings.map(
                    (title) {
                      var index = widget.headings.indexOf(title);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () => navigateTo(index),
                            child: Text(widget.headings[index],
                                style: widget.appBar.titleTextStyle)),
                      );
                    },
                  )
                ],
              ),
        leading: widget.appBar?.leading,
        automaticallyImplyLeading: widget.appBar?.automaticallyImplyLeading,
        actions: widget.appBar?.actions,
        flexibleSpace: widget.appBar?.flexibleSpace,
        bottom: widget.appBar?.bottom,
        elevation: widget.appBar?.elevation,
        shadowColor: widget.appBar?.shadowColor,
        shape: widget.appBar?.shape,
        backgroundColor: widget.appBar?.backgroundColor,
        foregroundColor: widget.appBar?.foregroundColor,
        brightness: widget.appBar?.brightness,
        iconTheme: widget.appBar?.iconTheme,
        actionsIconTheme: widget.appBar?.actionsIconTheme,
        textTheme: widget.appBar?.textTheme,
        primary: widget.appBar?.primary,
        centerTitle: widget.appBar?.centerTitle,
        excludeHeaderSemantics: widget.appBar?.excludeHeaderSemantics,
        titleSpacing: widget.appBar?.titleSpacing,
        toolbarHeight: widget.appBar?.toolbarHeight,
        toolbarOpacity: widget.appBar?.toolbarOpacity,
        bottomOpacity: widget.appBar?.bottomOpacity,
        leadingWidth: widget.appBar?.leadingWidth,
        backwardsCompatibility: widget.appBar?.backwardsCompatibility,
        toolbarTextStyle: widget.appBar?.toolbarTextStyle,
        titleTextStyle: widget.appBar?.titleTextStyle,
        systemOverlayStyle: widget.appBar?.systemOverlayStyle);

    return Scaffold(
      appBar: out,
      body: PageView(
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        controller: _controller,
        children: [
          // Can we just stop and thank God for making this SO SIMPLE?!
          ...widget.children,
        ],
      ),
    );
  }
}
