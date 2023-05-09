import 'package:flutter/material.dart';
import '../../../../models/model_homes/models_stories/model_stories.dart';
import '../../../../models/models_user.dart';
import '../../../../providers/stories_providers/provider_stories.dart';

class StoriesHome extends StatefulWidget {
  const StoriesHome({super.key});

  @override
  State<StatefulWidget> createState() => _StoriesHome();

}

class _StoriesHome extends State<StoriesHome> {

  StoriesProvider  storiesProvider = StoriesProvider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: storiesProvider.getStories().map((storie){
          return CreateStories(storie: storie);
              }).toList()
          ),
        ),
      );
    }
  }

class CreateStories extends StatelessWidget {
  const CreateStories({
    Key? key,
    required this.storie,
  }) : super(key: key);

  final Storie storie;

  @override
  Widget build(BuildContext context) {
      return Row(
      children: [
        const SizedBox(width: 12),
        for(var i = 0; i < 3; i++)
        Container(
          height: 80,
          width: 80,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(3.5),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            UserModels.user[i].UrlPhoto,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                storie.name,
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
        ],
      );
    }
}