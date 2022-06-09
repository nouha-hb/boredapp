import 'dart:ffi';

class Activity {
  final String activity;
  final double access;
  final String type;
  final int participants;
  final double price;
  final String key;
  final String link;


  Activity({
    required this.activity,
   required this.access,
    required this.type,
    required this.participants,
    required this.price,
    required this.key,
     required this.link,
    
  
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
       type: json['type'],
       participants: json['participants'],
       price: json['price'],
       link:json['link'],
       key: json['key'],
       access: json['accessibility'],
      
    );
  }}
