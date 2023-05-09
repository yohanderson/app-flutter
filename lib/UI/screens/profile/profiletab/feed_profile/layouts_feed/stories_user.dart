import 'package:flutter/material.dart';
import '../../../../../../providers/stories_providers/provider_stories.dart';

class StoriesUser extends StatefulWidget {
  const StoriesUser({super.key});

  @override
  State<StatefulWidget> createState() => _StoriesUser();

}

class _StoriesUser extends State<StoriesUser> {

  StoriesProvider  storiesProvider = StoriesProvider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
      children: [
        const SizedBox(width: 5),
          SizedBox(
            height: 80,
            width: 80,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(3.5),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://2022.800noticias.com/cms/wp-content/uploads/2022/07/Doha-700x352.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                'Hostal',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        SizedBox(
            height: 80,
            width: 80,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(3.5),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://elcomercio.pe/resizer/yg3ruqU0LNAJOd_uNVu9_6ra_L8=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/5562AFYLD5AERCVP4RG5WPXACA.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Casas',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        SizedBox(
            height: 80,
            width: 80,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(3.5),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://cdn.forbes.com.mx/2020/02/Caban%CC%83as-en-los-a%CC%81rboles-Zuhaitz-i.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Paisaje',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                        onPressed: () {  },
                      icon: const Icon(Icons.add),),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
      ],
      ),
    );
  }
}