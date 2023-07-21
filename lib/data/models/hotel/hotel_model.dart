
class hotelModel {
  List<Hotels>? hotels;


  hotelModel({this.hotels});

  hotelModel.fromJson(Map<String, dynamic> json) {
    // search = json["search"];
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        // if(v['location'].contains(search)) {
          hotels!.add( Hotels.fromJson(v));
        // }
      });
    }



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotels != null) {
      data['hotels'] = this.hotels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotels {
  int? id;
  String? name;
  String? location;
  int? price;
  int? starRating;
  List<String>? amenities;
  List<String>? images;
  String? description;
  List<RoomTypes>? roomTypes;

  Hotels(
      {this.id,
        this.description,
        this.name,
        this.location,
        this.price,
        this.starRating,
        this.amenities,
        this.images,
        this.roomTypes});

  Hotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    price = json['price'];
    description = json['description'];
    starRating = json['star_rating'];
    amenities = json['amenities'].cast<String>();
    images = json['images'].cast<String>();
    if (json['room_types'] != null) {
      roomTypes = <RoomTypes>[];
      json['room_types'].forEach((v) {
        roomTypes!.add(new RoomTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['price'] = this.price;
    data['star_rating'] = this.starRating;
    data['amenities'] = this.amenities;
    data['images'] = this.images;
    if (this.roomTypes != null) {
      data['room_types'] = this.roomTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomTypes {
  String? name;
  int? price;
  int? capacity;
  int? beds;
  List<String>? images;

  RoomTypes({this.name, this.price, this.capacity, this.beds});

  RoomTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    images = json['images'].cast<String>();
    capacity = json['capacity'];
    beds = json['beds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['capacity'] = this.capacity;
    data['beds'] = this.beds;
    return data;
  }
}
