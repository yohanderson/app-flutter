import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:merkabah/UI/widgets/styles/text_theme.dart';
import 'package:merkabah/models/models_user.dart';

class DetailsPost extends StatefulWidget {
  const DetailsPost({
    Key? key,
    required this.place,
    required this.screenHeight,
}): super(key: key);

final TravelPlace place;
final double screenHeight;

  @override
  State<DetailsPost> createState() => _DetailsPostState();
}

class _DetailsPostState extends State<DetailsPost> {
  late ScrollController _controller;
  late ValueNotifier<double> bottomPercentNotifier;
  bool _isAnimationscroll = false;
  void _scrollListener(){

    var percent =
        _controller.position.pixels / MediaQuery.of(context).size.height;
        bottomPercentNotifier.value = (percent / .3).clamp(0.0, 1.0);

  }

  void _isScrollingListener() {
    var percent =
        _controller.position.pixels / widget.screenHeight;
        if (!_controller.position.isScrollingNotifier.value) {
          if (percent < .3 && percent > .1) {
            setState(() => _isAnimationscroll = true);
            _controller.animateTo(
                widget.screenHeight * .3,
                duration: kThemeAnimationDuration,
                curve: Curves.decelerate
            ).then((value) => setState(() => _isAnimationscroll = false));
          }
          if (percent < .1 && percent > .0) {
            setState(() => _isAnimationscroll = true);
            _controller.animateTo(
                0,
                duration: kThemeAnimationDuration,
                curve: Curves.decelerate
            ).then((value) => setState(() => _isAnimationscroll = false));
          }
          if (percent < .5 && percent > .3) {
            setState(() => _isAnimationscroll = true);
            _controller.animateTo(
                widget.screenHeight * .3,
                duration: kThemeAnimationDuration,
                curve: Curves.decelerate
            ).then((value) => setState(() => _isAnimationscroll = false));
          }
        }
  }

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: widget.screenHeight * .4);
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.position.isScrollingNotifier
      .addListener(_isScrollingListener);
    });
    bottomPercentNotifier = ValueNotifier(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: _isAnimationscroll,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                    delegate: BuilderPersistentDelegate(
                        maxExtent: MediaQuery.of(context).size.height,
                        minExtent: 240,
                        builder: (percent) {

                          final bottomPercent = (percent / .3).clamp(0.0, 1.0);

                          return AnimatedDetailsPost(
                            place: widget.place,
                            toPercent: ((1 - percent) / .5).clamp(0.0, 1.0),
                            bottomPercent: bottomPercent,

                          );
                        } ),
                ),
                SliverToBoxAdapter(
                  child: TraslateAnimation(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.black26,),
                              Flexible(
                                  child: Text(
                                    widget.place.locationDesc,
                                    style: context.bodyText1.copyWith(color: Colors.blue),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(widget.place.description),
                            const SizedBox(height: 20,),
                            Center(
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                color: Colors.indigoAccent[100],
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Align(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, PageRouteBuilder(
                                        pageBuilder:  (_, animation, __) => FadeTransition(
                                          opacity: animation,
                                          child: const Scaffold(
                                            body: CheckAviallabiliy(),
                                          ),
                                        ),
                                      ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.calendar_month, color: Colors.indigo,),
                                        SizedBox(width: 10,),
                                        Text('Check Availability',
                                        style: TextStyle(
                                          color: Colors.indigo
                                        ),
                                        ),
                                      ],
                                    ),
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            const Text('PLACES IN THIS COLLECTION',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemExtent:  150,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: TravelPlace.place.length,
                        itemBuilder: (context, index) {
                          final places = TravelPlace.place[index];
                          return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  places.imageUrl.first,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          );
                        } ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 150,),)
              ],
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: bottomPercentNotifier,
            builder: (context, value, child) {
              return Positioned.fill(
                  top: null,
                  bottom: -100 * (1.2 - value),
                  child: child!);
            },
            child: Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white,
                  ],
                ),
              ),
              child: Row(
                children: [
                        Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            for(var i = 0; i < 3; i++)
                            Align(
                            widthFactor: .7,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      UserModels.user[i].UrlPhoto
                                  ),
                                ),
                              ),
                            ),
                          ),
                            const SizedBox(width: 15),
                            const Text(
                                'comments',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '120',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(width: 10,),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                        ),
                        const Spacer(),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              ),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckAviallabiliy extends StatelessWidget {
  const CheckAviallabiliy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,);
  }
}


class GradientStatusTag extends StatelessWidget {
  const GradientStatusTag ({
    Key? key,
    required this.statusTag
  }) : super (key: key);

  final StatusTag statusTag;

  @override
  Widget build(BuildContext context) {
    String text;
    List<Color> colors;
    switch(statusTag){
      case StatusTag.popular:
        text = 'Popular places';
        colors = [Colors.amber, Colors.orange.shade600];
        break;
      case StatusTag.event:
        text = 'Event';
        colors = [Colors.cyan, Colors.blue.shade600];
        break;
    }
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Text(
        text,
        style: context.subtitle1.copyWith(color: Colors.white),
      ),
    );
  }
}

class AnimatedDetailsPost extends StatelessWidget {

  final TravelPlace place;
  final double toPercent;
  final double bottomPercent;

  const AnimatedDetailsPost({super.key, required this.place, required this.toPercent, required this.bottomPercent});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final imageUrl = place.imageUrl;
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - bottomPercent),
                      bottom:  160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                        scale: lerpDouble(1, 1.4, bottomPercent)!,
                      child: PageViewImage(place: place, imageUrl: imageUrl),
                    ),
                  ),
                  Positioned(
                    top: topPadding,
                    left: -10 * (1 - bottomPercent),
                    child: const BackButton(
                      color: Colors.white,
                    ),),
                  Positioned(
                    top: topPadding,
                    right: 10 * (1 - bottomPercent),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                      color: Colors.white,
                    ),),
                  Positioned(
                      top: lerpDouble(-30, 140, toPercent)!
                      .clamp(topPadding + 15, 140),
                      left: lerpDouble(60, 30, toPercent),
                      right: 20,
                          child: AnimatedOpacity(
                          duration: kThemeAnimationDuration,
                          opacity: bottomPercent < 1 ? 0: 1,
                          child: Text(
                            place.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: lerpDouble(20, 40, toPercent),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  Positioned(
                          left: 35,
                          top: 200,
                          child: AnimatedOpacity(
                            duration: kThemeAnimationDuration,
                            opacity: bottomPercent < 1 ? 0: 1,
                            child: Opacity(
                              opacity:   toPercent,
                              child: GradientStatusTag(
                                statusTag: place.statusTag,
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
            top: null,
            bottom: -195 * (1 - toPercent),
            child: TraslateAnimation(
                child: _LikesAndshared(place: place)),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
        ),
        Positioned.fill(
            top: null,
            child: TraslateAnimation(child: _userInfoContainer(place: place)),
        ),
      ],
    );
  }
}

class TraslateAnimation extends StatelessWidget {
  const TraslateAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder<double>(
      tween:  Tween(begin: 1, end: 0),
      duration: const Duration (milliseconds: 600),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
        offset: Offset(0, 100 * value),
          child: child,
    );
    },
      child: child,
    );
  }

}

class _userInfoContainer extends StatelessWidget {
  const _userInfoContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
      color: Colors.white,
       borderRadius: BorderRadius.vertical(
         top: Radius.circular(30),
       )
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(place.user.UrlPhoto),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.user.name,
                style: context.bodyText1.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'yesterday at 9:10 p.m.',
                style: context.bodyText1.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: (){},
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon:  const Icon(Icons.add, size: 26,),
            label: const Text('follow'),
          ),
        ],
      ),
    );
  }
}

class _LikesAndshared extends StatelessWidget {
  const _LikesAndshared({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: (){},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon:  const Icon(Icons.favorite_border, size: 26),
            label: Text(place.likes.toString()),
          ),
          TextButton.icon(
            onPressed: (){},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon:  const Icon(Icons.reply, size: 26),
            label: Text(place.shared.toString()),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: (){},
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue.shade600, backgroundColor: Colors.blue.shade100,
              textStyle: context.subtitle1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon:  const Icon(Icons.check_circle_outline, size: 26,),
            label: const Text('Checking'),
          ),
        ],
      ),
    );
  }
}

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    Key? key,
    required this.place,
    required this.imageUrl,
  }) : super(key: key);

  final TravelPlace place;
  final List<String> imageUrl;

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Expanded(
      child: PageView.builder(
      itemCount: widget.place.imageUrl.length,
      onPageChanged: (value) {
        setState(() => currentIndex = value);
      } ,
      physics: const BouncingScrollPhysics(),
      controller: PageController(viewportFraction: .9),
      itemBuilder: (context, index) {
        final imageUrl = widget.place.imageUrl[index];
        final isSelected = currentIndex == index;
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: EdgeInsets.only(
              right: 10,
              top: isSelected ? 5 : 20,
              bottom: isSelected ? 5 : 20,
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.darken,
            ),
              ),
          ),
        );
      },
          ),
          ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            widget.imageUrl.length,
                  (index) {
                    final isSelected = currentIndex == index;
                    return AnimatedContainer(
                      duration: kThemeAnimationDuration,
                    color: isSelected ? Colors.black38 : Colors.black12,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 3,
                    width: isSelected ? 20 : 10,
                  );
  }
          ),
          ),
    ],
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
BuilderPersistentDelegate({
required double maxExtent,
required double minExtent,
required this.builder,
}) : _maxExtent = maxExtent,
_minExtent = minExtent;

final double _maxExtent;
final double _minExtent;
final Widget Function(double percent) builder;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}