import 'package:flutter/material.dart';
import 'package:merkabah/UI/widgets/styles/text_theme.dart';
import 'package:merkabah/models/models_user.dart';
import 'detalis_post.dart';

class FeedHome extends StatelessWidget {
  const FeedHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
          itemCount:  TravelPlace.place.length,
          itemExtent: 350,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
          itemBuilder: (context, index) {
            final place = TravelPlace.place[index];
            final statusTag = place.statusTag;
            return Hero(
              tag: place.id,
              child: Material(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder:  (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          body: DetailsPost(place: place,
                            screenHeight: MediaQuery.of(context).size.height,),
                        ),
                      ),
                    ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(place.imageUrl.first),
                        fit:  BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(place.user.UrlPhoto),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place.user.name,
                                  style: context.bodyText1.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'yesterday at 9:10 p.m.',
                                  style: context.bodyText1.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          place.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GradientStatusTag(statusTag: statusTag),
                        const Spacer(),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, shape: const StadiumBorder(),
                              ),
                              icon:  const Icon(Icons.favorite_border),
                              label: Text(place.likes.toString()),
                            ),
                            TextButton.icon(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, shape: const StadiumBorder(),
                              ),
                              icon: const Icon(Icons.reply),
                              label: Text(place.shared.toString()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}

