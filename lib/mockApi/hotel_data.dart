List amenities = [
  "Spa",
  "Gym",
  "Parking",

  "Hot Tub",

  "Restaurant",
  "Wi-Fi",
  "Ski-in/Ski-out",
  "Swimming Pool",

];

Map<String, dynamic> hotelData = {
  "hotels": [
    {
      "id": 1,
      "name": "Luxury Resort",
      "location": "Beachfront, Malibu, CA",
      "price": 250,
      "star_rating": 5,
      "amenities": ["Swimming Pool", "Spa", "Gym", "Restaurant"],
      "description":
          "Experience a world of comfort and elegance in our well-appointed rooms and suites. Each one is meticulously designed with modern amenities and plush furnishings to ensure a restful and enjoyable stay. From spacious beds to sleek bathrooms, every detail is crafted to cater to your needs.",
      "images":[
        "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",

      ],

      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1535827841776-24afc1e255ac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80,"
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Deluxe Room",
          "price": 250,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Suite",
          "price": 400,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 2,
      "name": "Cozy Inn",
      "location": "Downtown, Seattle, WA",
      "price": 150,
      "star_rating": 3,
      "amenities": ["Wi-Fi", "Parking", "Restaurant"],
      "description":
          "Experience a world of comfort and elegance in our well-appointed rooms and suites. Each one is meticulously designed with modern amenities and plush furnishings to ensure a restful and enjoyable stay. From spacious beds to sleek bathrooms, every detail is crafted to cater to your needs.",
      "images":[
        "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",

      ]
      ,
      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Standard Room",
          "price": 150,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Family Room",
          "price": 200,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 3,
      "name": "Mountain Lodge",
      "location": "Ski Resort, Aspen, CO",
      "price": 300,
      "star_rating": 4,
      "amenities": ["Ski-in/Ski-out", "Hot Tub", "Restaurant"],
      "description":
          "Experience a world of comfort and elegance in our well-appointed rooms and suites. Each one is meticulously designed with modern amenities and plush furnishings to ensure a restful and enjoyable stay. From spacious beds to sleek bathrooms, every detail is crafted to cater to your needs.",
      "images": [
        "https://images.unsplash.com/photo-1535827841776-24afc1e255ac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80",

      ],
      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Standard Room",
          "price": 300,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Mountain View Suite",
          "price": 450,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 4,

        "name": "Evergreen Retreat",
        "location": "Mountain Resort, Lake Tahoe, CA",
        "price": 250,
        "star_rating": 3,
        "amenities": ["Lakefront View", "Sauna", "Fitness Center", "Free Wi-Fi"],
        "description": "Escape to tranquility at Evergreen Retreat, where nature meets luxury. Our lodge is nestled amid the stunning landscapes of Lake Tahoe, providing breathtaking lakefront views. Unwind in our cozy rooms and indulge in the serene atmosphere. The lodge offers a sauna to relax your body after a day of outdoor activities. Stay connected with complimentary Wi-Fi and keep up with your fitness routine at our state-of-the-art fitness center.",


      "images": [
        "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",

      ],
      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Standard Room",
          "price": 300,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Mountain View Suite",
          "price": 450,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 5,


        "name": "Cascading Falls",
        "location": "Waterfall Valley, Ithaca, NY",
        "price": 180,
        "star_rating": 3,
        "amenities": ["Waterfall View", "Garden", "Library"],
        "description": "Experience the beauty of Cascading Falls Lodge. Located in the enchanting Waterfall Valley of Ithaca, New York, our lodge offers stunning waterfall views, a peaceful garden, and a well-stocked library for your relaxation and pleasure."
      ,


      "images": [
        "https://images.unsplash.com/photo-1488155665162-7fc8d8093d18?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",

      ],
      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Standard Room",
          "price": 300,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Mountain View Suite",
          "price": 450,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 6,
      "name": "Whispering Pines",
      "location": "Forest Retreat, Big Sur, CA",
      "price": 300,
      "star_rating": 4,
      "amenities": ["Forest View", "Fire Pit", "Yoga Studio"],
      "description": "Immerse yourself in tranquility at Whispering Pines Lodge. Nestled within the lush forests of Big Sur, California, our lodge provides captivating forest views, a cozy fire pit, and a serene yoga studio to nourish your body and soul."
      ,"images":[
    "https://images.unsplash.com/photo-1540541338287-41700207dee6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",

    ],

      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1535827841776-24afc1e255ac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80,"
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Deluxe Room",
          "price": 250,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Suite",
          "price": 400,
          "capacity": 4,
          "beds": 2
        }
      ]
    },
    {
      "id": 7,
      "name": "Alpine Meadows",
      "location": "Mountain Range, Telluride, CO",
      "price": 400,
      "star_rating": 5,
      "amenities": ["Ski-in/Ski-out", "Hot Tub", "Fine Dining"],
      "description": "Escape to luxury at Alpine Meadows Resort. Surrounded by the breathtaking Telluride mountain range, our lodge offers ski-in/ski-out access for the avid skiers. Relax in our hot tub, indulge in fine dining at our in-house restaurant, and experience the epitome of mountain retreats."
      ,"images":[
     "https://images.unsplash.com/photo-1505843513577-22bb7d21e455?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80",

    ]
      ,
      "room_types": [
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Standard Room",
          "price": 150,
          "capacity": 2,
          "beds": 1
        },
        {
          "images": [
            "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80",
            "https://plus.unsplash.com/premium_photo-1663091114903-b5e3c56160d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80"
          ],
          "name": "Family Room",
          "price": 200,
          "capacity": 4,
          "beds": 2
        }
      ]
    },


  ]
};
