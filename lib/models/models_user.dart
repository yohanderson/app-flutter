class TravelPlace {

  final String id;
  final String name;
  final UserModels user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imageUrl;

  TravelPlace({
    required this.name,
    required this.user,
    required this.imageUrl,
    required this.id,
    required this.likes,
    required this.shared,
    required this.description,
    required this.statusTag,
    required this.locationDesc
  });

  static final place = [
    TravelPlace(
      id: '3',
      name: 'Rivera Maya',
      likes: 500,
      shared: 240,
      description:
      'Rivera Maya Tiene mas de 120 km de costa truquesa critiana,'
          'playas de arena blanca, sitios arqueologicos, parques'
          'naturaleza y actividades acuaticas unicas',
      imageUrl: [
        'https://cdn.forbes.com.mx/2020/02/Azulik-Tulum-.jpg',
            'https://cdn.forbes.com.mx/2020/02/Azulik-Tulum-.jpg',
            'https://cdn.forbes.com.mx/2020/02/Azulik-Tulum-.jpg',
      ],
      statusTag: StatusTag.popular,
      user: UserModels.alex,
      locationDesc: 'Golden Gate cat Brige, san francisco california',
    ),
    TravelPlace(
      id: '1',
      name: 'Tulum',
      likes: 140,
      shared: 49,
      description: 'Tulum fue una ciudad amurallada de la cultura maya ubicada en el'
          'Estado de Quintana roo, en el sureste de Mexico, en la costa'
          'del mar Caribe',
      imageUrl: [
        'https://cde.3.elcomercio.pe/ima/0/1/7/2/7/1727986.jpg',
            'https://cdn.forbes.com.mx/2020/02/Azulik-Tulum-.jpg',
            'https://cdn.forbes.com.mx/2020/02/andBeyond-NgorongoroCraterLodge.jpg',
      ],
      statusTag: StatusTag.event,
      user: UserModels.mario,
      locationDesc: 'Golden Gate cat Brige, san francisco california',
    ),
    TravelPlace(
      id: '2',
      name: 'Omctepec',
      likes: 29,
      shared: 40,
      description: 'omctepec (en nahual: ome, tepetl, dos cerros lugar entre dos cerros) es un publo muy lindo',
      imageUrl: [
            'https://cdn.forbes.com.mx/2020/02/Caban%CC%83as-en-los-a%CC%81rboles-Zuhaitz-i.jpg',
            'https://elcomercio.pe/resizer/yg3ruqU0LNAJOd_uNVu9_6ra_L8=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/5562AFYLD5AERCVP4RG5WPXACA.jpg',
            'https://2022.800noticias.com/cms/wp-content/uploads/2022/07/Doha-700x352.jpg',
      ],
      statusTag: StatusTag.event,
      user: UserModels.luna,
      locationDesc: 'Golden Gate cat Brige, san francisco california',
    ),
  ];
}


class UserModels {
  UserModels(this.name, this.UrlPhoto);

  final String name;
  final String UrlPhoto;

  static UserModels alex = UserModels('alex fernandez', 'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=300');
  static UserModels mario = UserModels('mario albeiro', 'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=300');
  static UserModels luna = UserModels('luna benioly', 'https://images.pexels.com/photos/1819483/pexels-photo-1819483.jpeg?auto=compress&cs=tinysrgb&w=300');

  static List<UserModels> user = [alex, mario, luna];
}

enum StatusTag {popular, event}
