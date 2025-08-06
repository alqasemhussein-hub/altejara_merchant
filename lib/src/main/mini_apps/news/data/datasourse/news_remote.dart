import 'package:techara_merchant/src/main/mini_apps/news/data/model/news.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<NewsModel>> getNews() async {
    return [
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Prime Minister Mohammed Shia al-Sudani stressed on Wednesday the need for development operations to preserve Mosul\'s historical heritage. Prime Minister\'s media office stated in a statement received by the Iraqi News Agency (INA), "Prime Minister Mohammed Shia al-Sudani conducted a field visit to the development and reconstruction project for the riverfront of the Old City of Mosul and reviewed the progress of work." Prime Minister highlighted "the importance of this heritage area, given its historical symbolism for its heritage, archaeological, and religious sites, he noted that the reconstruction project was coordinated between ministries and the local government and designed by a Spanish company. The statement emphasized the adoption of heritage standards in cooperation with UNESCO, taking into account the value of this area and the city, Prime Minister emphasized the "need to preserve the historical heritage, with its significance for the entire world, not just Iraq, while preserving the identity of the site and reconstructing it according to established priorities." The statement pointed out that "the project, which began work this year, includes the organization of the riverfront of the old city, which is located between the old bridge and the fifth bridge and overlooks the Tigris River, with the establishment of a corniche and Perch, the construction of (273) heritage houses, and the establishment of recreational parks with all infrastructure works (water, sewage, electricity and communications)."',
        title:
            'PM stresses the need for development operations to preserve Mosul',

        publishedAt: DateTime.now(),
        categories: [
          CategoryEntity(name: 'Politics', color: "#B01D4F"),
          CategoryEntity(name: 'Iraq', color: "#0B5B4C"),
        ],
        isBreaking: true,
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms",
        source: "Iraqi News Agency",
        description:
            'Raw sewage continues to spill into the Tigris River in central Baghdad, exposing a systemic failure in Iraq’s wastewater infrastructure despite repeated cleanup campaigns. Shafaq News documented multiple discharge points, particularly along al-Nahr Street, where untreated waste flows directly into the river between the Medical City complex and Abu Nuwas Street—turning pollution into a daily norm.',
        title: 'Iraqi capital’s river becomes open sewer',

        publishedAt: DateTime(2025, 08, 04, 11, 38),
        categories: [
          CategoryEntity(name: 'Politics', color: "#B01D4F"),
          CategoryEntity(name: 'Iraq', color: "#0B5B4C"),
          CategoryEntity(name: 'Updates', color: "#466800"),
        ],
        isBreaking: true,
        postImage: "https://media.shafaq.com/media/arcella/1754288432892.jpg",
        images: [
          "https://media.shafaq.com/media/arcella/1754288432892.jpg",
          "https://media.shafaq.com/media/arcella/1754288674555.jpg",
          "https://media.shafaq.com/media/arcella/1754288674555.jpg",
          "https://media.shafaq.com/media/arcella/1754288674555.jpg",
        ],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Raw sewage continues to spill into the Tigris River in central Baghdad, exposing a systemic failure in Iraq’s wastewater infrastructure despite repeated cleanup campaigns. Shafaq News documented multiple discharge points, particularly along al-Nahr Street, where untreated waste flows directly into the river between the Medical City complex and Abu Nuwas Street—turning pollution into a daily norm.',
        title: 'Iraqi capital’s river becomes open sewer',

        publishedAt: DateTime(2025, 08, 04, 11, 38),
        categories: [
          CategoryEntity(name: 'Politics', color: "#B01D4F"),
          CategoryEntity(name: 'Iraq', color: "#0B5B4C"),
          CategoryEntity(name: 'Updates', color: "#466800"),
        ],
        isBreaking: false,
        postImage: "https://media.shafaq.com/media/arcella/1754288432892.jpg",
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi Entertainment Network",
        description: 'Iraqi capital’s river becomes open sewer',
        title:
            'Minister highlights the importance of cultural events to boost tourism in Baghdad',

        publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        categories: [
          CategoryEntity(name: 'Culture', color: "#B01D4F"),
          CategoryEntity(name: 'Iraq', color: "#0B5B4C"),
        ],
        isBreaking: false,
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Prime Minister Mohammed Shia al-Sudani stressed on Wednesday the need for development operations to preserve Mosul\'s historical heritage. Prime Minister\'s media office stated in a statement received by the Iraqi News Agency (INA), "Prime Minister Mohammed Shia al-Sudani conducted a field visit to the development and reconstruction project for the riverfront of the Old City of Mosul and reviewed the progress of work." Prime Minister highlighted "the importance of this heritage area, given its historical symbolism for its heritage, archaeological, and religious sites, he noted that the reconstruction project was coordinated between ministries and the local government and designed by a Spanish company. The statement emphasized the adoption of heritage standards in cooperation with UNESCO, taking into account the value of this area and the city, Prime Minister emphasized the "need to preserve the historical heritage, with its significance for the entire world, not just Iraq, while preserving the identity of the site and reconstructing it according to established priorities." The statement pointed out that "the project, which began work this year, includes the organization of the riverfront of the old city, which is located between the old bridge and the fifth bridge and overlooks the Tigris River, with the establishment of a corniche and Perch, the construction of (273) heritage houses, and the establishment of recreational parks with all infrastructure works (water, sewage, electricity and communications)."',

        publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        title: 'Showcasing local arts and crafts to promote Iraqi heritage',

        categories: [CategoryEntity(name: 'Updates', color: "#466800")],
        isBreaking: false,
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Prime Minister Mohammed Shia al-Sudani stressed on Wednesday the need for development operations to preserve Mosul\'s historical heritage. Prime Minister\'s media office stated in a statement received by the Iraqi News Agency (INA), "Prime Minister Mohammed Shia al-Sudani conducted a field visit to the development and reconstruction project for the riverfront of the Old City of Mosul and reviewed the progress of work." Prime Minister highlighted "the importance of this heritage area, given its historical symbolism for its heritage, archaeological, and religious sites, he noted that the reconstruction project was coordinated between ministries and the local government and designed by a Spanish company. The statement emphasized the adoption of heritage standards in cooperation with UNESCO, taking into account the value of this area and the city, Prime Minister emphasized the "need to preserve the historical heritage, with its significance for the entire world, not just Iraq, while preserving the identity of the site and reconstructing it according to established priorities." The statement pointed out that "the project, which began work this year, includes the organization of the riverfront of the old city, which is located between the old bridge and the fifth bridge and overlooks the Tigris River, with the establishment of a corniche and Perch, the construction of (273) heritage houses, and the establishment of recreational parks with all infrastructure works (water, sewage, electricity and communications)."',

        publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        title: "Showcasing local arts and crafts to promote Iraqi heritage",

        categories: [CategoryEntity(name: 'Updates', color: "#466800")],
        isBreaking: false,
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Prime Minister Mohammed Shia al-Sudani stressed on Wednesday the need for development operations to preserve Mosul\'s historical heritage. Prime Minister\'s media office stated in a statement received by the Iraqi News Agency (INA), "Prime Minister Mohammed Shia al-Sudani conducted a field visit to the development and reconstruction project for the riverfront of the Old City of Mosul and reviewed the progress of work." Prime Minister highlighted "the importance of this heritage area, given its historical symbolism for its heritage, archaeological, and religious sites, he noted that the reconstruction project was coordinated between ministries and the local government and designed by a Spanish company. The statement emphasized the adoption of heritage standards in cooperation with UNESCO, taking into account the value of this area and the city, Prime Minister emphasized the "need to preserve the historical heritage, with its significance for the entire world, not just Iraq, while preserving the identity of the site and reconstructing it according to established priorities." The statement pointed out that "the project, which began work this year, includes the organization of the riverfront of the old city, which is located between the old bridge and the fifth bridge and overlooks the Tigris River, with the establishment of a corniche and Perch, the construction of (273) heritage houses, and the establishment of recreational parks with all infrastructure works (water, sewage, electricity and communications)."',

        publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        title: "Showcasing local arts and crafts to promote Iraqi heritage",

        categories: [CategoryEntity(name: 'Updates', color: "#466800")],
        isBreaking: false,
        images: [],
      ),
      NewsModel(
        sourceImage:
            "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
        source: "Iraqi News Agency",
        description:
            'Prime Minister Mohammed Shia al-Sudani stressed on Wednesday the need for development operations to preserve Mosul\'s historical heritage. Prime Minister\'s media office stated in a statement received by the Iraqi News Agency (INA), "Prime Minister Mohammed Shia al-Sudani conducted a field visit to the development and reconstruction project for the riverfront of the Old City of Mosul and reviewed the progress of work." Prime Minister highlighted "the importance of this heritage area, given its historical symbolism for its heritage, archaeological, and religious sites, he noted that the reconstruction project was coordinated between ministries and the local government and designed by a Spanish company. The statement emphasized the adoption of heritage standards in cooperation with UNESCO, taking into account the value of this area and the city, Prime Minister emphasized the "need to preserve the historical heritage, with its significance for the entire world, not just Iraq, while preserving the identity of the site and reconstructing it according to established priorities." The statement pointed out that "the project, which began work this year, includes the organization of the riverfront of the old city, which is located between the old bridge and the fifth bridge and overlooks the Tigris River, with the establishment of a corniche and Perch, the construction of (273) heritage houses, and the establishment of recreational parks with all infrastructure works (water, sewage, electricity and communications)."',

        publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        title: "Showcasing local arts and crafts to promote Iraqi heritage",

        categories: [CategoryEntity(name: 'Updates', color: "#466800")],
        isBreaking: false,
        images: [],
      ),
    ];
  }
}
