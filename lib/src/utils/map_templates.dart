enum FlutterMapTemplate<T> {
  dGis(
    types: DGis(),
  ),
  yandex(
    types: YandexMapLayers(),
  ),
  google(
    types: GoogleMapLayers(),
  ),
  thunderForest(
    types: ThunderForestLayers(),
  );

  const FlutterMapTemplate({
    required this.types,
  });

  final T types;
}

class ThunderForestLayers {
  const ThunderForestLayers();
  String get openCycleMap =>
      'https://tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get landscape =>
      'https://tile.thunderforest.com/landscape/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get outdoors =>
      'https://tile.thunderforest.com/outdoors/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get transportDark =>
      'https://tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get spinalMap =>
      'https://tile.thunderforest.com/spinal-map/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get pioneer =>
      'https://tile.thunderforest.com/pioneer/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get mobileAtlas =>
      'https://tile.thunderforest.com/mobile-atlas/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get neighbourhood =>
      'https://tile.thunderforest.com/neighbourhood/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get atlas =>
      'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
  String get transport =>
      'https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=ff4ddd3575834c4892850e42004762a6';
}

class GoogleMapLayers {
  const GoogleMapLayers();
  String get roadsOnly =>
      'http://mt0.google.com/vt/lyrs=h&hl=ru&x={x}&y={y}&z={z}';
  String get standardRoadmap =>
      'http://mt0.google.com/vt/lyrs=m&hl=ru&x={x}&y={y}&z={z}';
  String get terrain =>
      'http://mt0.google.com/vt/lyrs=p&hl=ru&x={x}&y={y}&z={z}';
  String get alteredRoadmap =>
      'http://mt0.google.com/vt/lyrs=r&hl=ru&x={x}&y={y}&z={z}';
  String get satelliteOnly =>
      'http://mt0.google.com/vt/lyrs=s&hl=ru&x={x}&y={y}&z={z}';
  String get terrainOnly =>
      'http://mt0.google.com/vt/lyrs=t&hl=ru&x={x}&y={y}&z={z}';
  String get hybrid =>
      'http://mt0.google.com/vt/lyrs=y&hl=ru&x={x}&y={y}&z={z}';
}

class YandexMapLayers {
  const YandexMapLayers();
  String get main =>
      'https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&scale=1&lang=ru_RU';
}

class OpenStreetLayers {
  const OpenStreetLayers();
  String get main => 'http://tile.openstreetmap.org/{&z}/{&x}/{&y}.png';
}

class DGis {
  const DGis();
  String get main => 'http://tile2.maps.2gis.com/tiles?&x={x}&y={y}&z={z}';
}
