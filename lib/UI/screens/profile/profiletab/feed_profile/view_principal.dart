import 'package:flutter/material.dart';
import 'package:merkabah/UI/screens/home/Home_parts/detalis_post.dart';
import 'package:merkabah/models/models_user.dart';

class ViewPrincipal extends StatelessWidget {
  const ViewPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 0.90,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
          itemCount:  TravelPlace.place.length,
          itemBuilder: (context, index) {
            final place = TravelPlace.place[index];
            return InkWell(
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
              ),
            );
          },
        ),
        ),
      ],
    );
  }
}