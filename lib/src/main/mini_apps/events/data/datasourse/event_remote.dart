import 'package:techara_merchant/src/main/mini_apps/events/data/model/event.dart';

abstract class EventsRemoteDataSource {
  Future<List<EventModel>> getEevents();
}

class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  @override
  Future<List<EventModel>> getEevents() async {
    return [
      EventModel(
        title: 'Tech Conference 2025',
        description: 'Join the biggest tech minds from around the world.',
        imageUrls: [
          'https://cdn.pixabay.com/photo/2025/07/25/11/24/cat-9734651_1280.jpg',
          'https://cdn.pixabay.com/photo/2022/03/27/11/23/cat-7094808_1280.jpg',
        ],
        startDate: DateTime(2025, 8, 20, 9, 0),
        endDate: DateTime(2025, 8, 20, 17, 0),
        location: 'Silicon Valley Convention Center',
        source: 'Tech Events Inc.',
        categories: ['Technology', 'Conference'],
        ticketsPoints: ['Early Bird', 'Standard', 'VIP'],
      ),
      EventModel(
        title: 'Art & Wine Festival',
        description: 'A celebration of local artists and wineries.',
        imageUrls: [
          'https://cdn.pixabay.com/photo/2025/07/25/11/24/cat-9734651_1280.jpg',
          'https://cdn.pixabay.com/photo/2022/03/27/11/23/cat-7094808_1280.jpg',
        ],
        startDate: DateTime(2025, 9, 10),
        endDate: DateTime(2025, 9, 12),
        location: 'Downtown Napa',
        source: 'City of Napa',
        categories: ['Art', 'Festival', 'Wine'],
        ticketsPoints: ['General Admission', 'VIP'],
      ),
      EventModel(
        title: 'Marathon 2025',
        description:
            'Annual city marathon with 5K, 10K, and half marathon races.',
        imageUrls: [
          'https://cdn.pixabay.com/photo/2022/03/27/11/23/cat-7094808_1280.jpg',
        ],
        startDate: DateTime(2025, 10, 5, 6, 30),
        endDate: DateTime(2025, 10, 5, 14, 0),
        location: 'Central Park',
        source: 'RunStrong Org',
        categories: ['Sports', 'Health', 'Outdoor'],
        ticketsPoints: ['Registration', 'Charity Run'],
      ),
      EventModel(
        title: 'Startup Pitch Night',
        description: 'Watch new startups pitch ideas to top VCs.',
        imageUrls: [
          'https://cdn.pixabay.com/photo/2025/07/25/11/24/cat-9734651_1280.jpg',
          'https://cdn.pixabay.com/photo/2022/03/27/11/23/cat-7094808_1280.jpg',
        ],
        startDate: DateTime(2025, 8, 15, 18, 0),
        endDate: DateTime(2025, 8, 15, 21, 0),
        location: 'Downtown Co-Working Hub',
        source: 'InnovateNow',
        categories: ['Business', 'Startup', 'Networking'],
        ticketsPoints: ['Free Entry', 'Networking Dinner'],
      ),
      EventModel(
        title: 'Jazz Under the Stars',
        description: 'Outdoor jazz concert featuring local artists.',
        imageUrls: [
          'https://cdn.pixabay.com/photo/2025/07/25/11/24/cat-9734651_1280.jpg',
          'https://cdn.pixabay.com/photo/2022/03/27/11/23/cat-7094808_1280.jpg',
        ],
        startDate: DateTime(2025, 9, 3, 20, 0),
        endDate: DateTime(2025, 9, 3, 23, 0),
        location: 'Riverside Amphitheater',
        source: 'City Events Committee',
        categories: ['Music', 'Concert', 'Outdoor'],
        ticketsPoints: ['General Admission', 'VIP Seating'],
      ),
    ];
  }
}
