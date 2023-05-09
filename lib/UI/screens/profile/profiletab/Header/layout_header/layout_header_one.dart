import 'package:flutter/material.dart';

class LayoutHeaderOne extends StatefulWidget {
  const LayoutHeaderOne({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutHeaderOne();
}

class _LayoutHeaderOne extends State<LayoutHeaderOne> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    child: Image.network(
                      'https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.21,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 110,
                      ),
                      SizedBox(
                        width: 300,
                        height: 55,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              height: 35,
                              width: 100,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: const [
                                    Text(
                                      '55',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'publicaciones',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 35,
                              width: 80,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: const [
                                    Text(
                                      '150',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Seguidores',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 35,
                              width: 70,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: const [
                                    Text(
                                      '200',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Seguidos',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 125,
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.all(3.5),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=300',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            height: 80,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Yohanderson Marquez',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  'April Rashel Marquez Rojas',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Taylor xael Maquez Rojas',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Maria Amorcito <3 <3',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
