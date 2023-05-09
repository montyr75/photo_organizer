import 'dart:convert';

const testData = '''DSC012333.jpg, Madrid, 2016-10-01 13:02:34
DSC044322.jpg, Milan, 2015-03-05 10:11:22
DSC130033.raw, Rio, 2018-06-02 17:01:30
DSC044322.jpeg, Milan, 2015-03-04 14:55:01
DSC130033.jpg, Rio, 2018-06-02 17:05:10
DSC012335.jpg, Milan, 2015-03-05 10:11:24''';

void main() {
  print(organizePhotos(testData));
}

String organizePhotos(String data) {
  // parse the string data into data objects
  final photos = LineSplitter().convert(data)
      .map((line) => Photo.parse(line))
      .toList();

  // group the photos by city
  final groupedPhotos = groupBy<Photo, String>(photos, (photo) => photo.city);

  // sort city photos by time stamp and assign padded sequence numbers
  for (final city in groupedPhotos.keys) {
    groupedPhotos[city]!.sort();

    int seq = 1;

    final padding = groupedPhotos[city]!.length.toString().length;

    for (final photo in groupedPhotos[city]!) {
      photo.sequence = (seq++).toString().padLeft(padding, '0');
    }
  }

  // construct output string
  final buffer = StringBuffer();
  photos.forEach(buffer.writeln);

  return buffer.toString();
}

class Photo implements Comparable<Photo> {
  final String city;
  final String ext;
  final DateTime timeStamp;
  String? sequence;

  Photo({required this.city, required this.ext, required this.timeStamp, this.sequence});

  factory Photo.parse(String data) {
    final dataPoints = data.split(',')
        .map((dataPoint) => dataPoint.trim())
        .toList();

    return Photo(
      city: dataPoints[1],
      ext: dataPoints.first.split('.').last,
      timeStamp: DateTime.parse(dataPoints.last),
    );
  }

  @override
  String toString() => "$city${sequence ?? ''}.$ext";

  @override
  int compareTo(Photo other) => timeStamp.compareTo(other.timeStamp);
}

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};

  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }

  return map;
}
