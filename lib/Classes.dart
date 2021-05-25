import 'package:flutter/material.dart';


class Notification {

  String description;
  Icon icon;

  Notification ({
    this.description,
    this.icon,
  });

}

List<Notification> notifications = [
  Notification(
    description: "User liked your post",
    icon: Icon(Icons.thumb_up),
  )

];


class Location {

  String city,state,country;

  Location({
    this.city,
    this.state,
    this.country,
  });

}

List<Location> locations = [
  Location(
    city: "Istanbul",
    state: "Avcılar",
    country: "Turkey",
  )

];

class Comment {

  String username, commentBody, userImageUrl, timeago;
  int postID;

  Comment({
    this.username,
    this.commentBody,
    this.userImageUrl,
    this.postID,
    this.timeago,
  });

}

List<Comment> comments = [
  Comment(
    username: "badboy",
    commentBody: "nice image",
    userImageUrl : 'assets/pp1.jpg',
    postID: 1,
    timeago : '10 mins',
  ),
  Comment(
    username: "badgirl",
    commentBody: "good image",
    userImageUrl : 'assets/pp2.jpg',
    postID: 2,
    timeago : '15 mins',
  ),
  Comment(
    username: "goodboy",
    commentBody: "eh",
    userImageUrl : 'assets/pp3.jpg',
    postID: 3,
    timeago : '20 mins',
  ) ];


class Post {
  String description, imgURL, username, userImageUrl, timeago,content;
  int commentCount, likeCount;
  List<Comment> comments;
  Location location;

  Post({
    this.username,
    this.description,
    this.comments,
    this.commentCount,
    this.likeCount,
    this.location,
    this.imgURL,
    this.userImageUrl,
    this.timeago,
    this.content,
  });

}

List<Post> posts = [
  Post(
    description: "nice friends",
    comments: comments,
    commentCount: 1,
    likeCount: 15,
    imgURL: 'assets/photo1.jpg',
    location: Location(city: "Istanbul", state: "Erenkoy",country: "Turkey",),
    username: "badboy",
    userImageUrl : 'assets/pp1.jpg',
    timeago : '10 mins',
    content: 'Travel',
  ),

  Post(
    description: "good friends",
    comments: comments,
    commentCount: 2,
    likeCount: 17,
    imgURL: 'assets/photo2.jpg',
    location: Location(city: "Istanbul", state: "Beylikduzu", country: "Turkey",),
    username: "badgirl",
    userImageUrl : 'assets/pp2.jpg',
    timeago : '15 mins',
      content: 'Friendship',
  ),
  Post(
    description: "Hadi kactim",
    comments: comments1,
    commentCount: 1,
    likeCount: 15,
    imgURL: 'assets/tosuncuk.jpg',
    location: Location(city: "Bangkok", state: "Sukhumvit",country: "Tayland",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '10 mins',
      content: 'Dolanmaca',
  ),

  Post(
    description: "Kacmaktayim",
    comments: comments2,
    commentCount: 2,
    likeCount: 17,
    imgURL: 'assets/Stonk.JPG',
    location: Location(city: "İzmir", state: "Karşıyaka", country: "Turkey",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '15 mins',
      content: 'Dolandik',
  ),
  Post(
    description: "Kacicam",
    comments: comments3,
    commentCount: 2,
    likeCount: 20,
    imgURL: 'assets/Doge.JPG',
    location: Location(city: "İzmir", state: "Göztepe", country: "Turkey",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '15 hour',
      content: 'Dolandirildik',
  ),

  Post(
    description: "bad #friends friends",
    comments: comments3,
    commentCount: 2,
    likeCount: 20,
    imgURL: 'assets/pp1.jpg',
    location: Location(city: "Istanbul", state: "Göztepe", country: "Turkey",),
    username: "badboy",
    userImageUrl : "https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    timeago : '12 hour',
      content: 'SWAG',
  ),

];

List<Post> user_post_0 = [
  Post(
    description: "nice friends",
    comments: comments1,
    commentCount: 1,
    likeCount: 15,
    imgURL: 'assets/photo1.jpg',
    location: Location(city: "Istanbul", state: "Erenkoy",country: "Turkey",),
    username: "badboy",
    userImageUrl : "https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    timeago : '10 mins',
      content: 'YOLO',
  ),

  Post(
    description: "good friends",
    comments: comments2,
    commentCount: 2,
    likeCount: 17,
    imgURL: 'assets/photo2.jpg',
    location: Location(city: "Istanbul", state: "Beylikduzu", country: "Turkey",),
    username: "badboy",
    userImageUrl : "https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    timeago : '15 mins',
      content: 'YOLO but 2',
  ),
  Post(
    description: "bad friends",
    comments: comments3,
    commentCount: 2,
    likeCount: 20,
    imgURL: 'assets/pp1.jpg',
    location: Location(city: "Istanbul", state: "Göztepe", country: "Turkey",),
    username: "badboy",
    userImageUrl : "https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    timeago : '15 hour',
      content: 'Sad',
  )

];

List<Post> user_post_1 = [
  Post(
    description: "Hadi kactim",
    comments: comments1,
    commentCount: 1,
    likeCount: 15,
    imgURL: 'assets/tosuncuk.jpg',
    location: Location(city: "Bankog", state: "Sukhumvit",country: "Tayland",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '10 mins',
    content: 'Dolanmaca',
  ),

  Post(
    description: "Kacmaktayim",
    comments: comments2,
    commentCount: 2,
    likeCount: 17,
    imgURL: 'assets/Stonk.JPG',
    location: Location(city: "İzmir", state: "Karşıyaka", country: "Turkey",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '15 mins',
    content: 'Dolandik',
  ),
  Post(
    description: "Kacicam",
    comments: comments3,
    commentCount: 2,
    likeCount: 20,
    imgURL: 'assets/Doge.JPG',
    location: Location(city: "İzmir", state: "Göztepe", country: "Turkey",),
    username: "Thedox",
    userImageUrl: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    timeago : '15 hour',
    content: 'Dolandirildik',
  )

];

/*class User {
  String name, surname, username,phoneNumber, mailAddress;
  int id;
  List <Products> basket = [];

  User({
    this.id,
    this.name,
    this.surname,
    this.username,
    this.mailAddress,
    this.phoneNumber,
    this.basket,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      username: json['username'] as String,
      mailAddress: json['mailAddress'] as String,
      phoneNumber: json['phoneNumber'] as String,

    );
  }
}*/

class User {
  String username, email, profileImg , bio;

  int id,postCount;
  List <int> followers, followed;
  List <Post> posts;
  List <Location> locations;
  List <Notification> notifications;

  User({
    this.username,
    this.email,
    this.profileImg,
    this.followed,
    this.followers,
    this.postCount,
    this.posts,
    this.locations,
    this.id,
    this.notifications ,
    this.bio,
  });





  getFollowedCount(){
    return followed.length;
  }
  getFollowersCount(){
    return followers.length;
  }



  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      bio: json['bio'] as String,
      profileImg: json['profileImg'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      postCount: json['postCount'] as int,
      notifications: json['notifications'] as List<Notification>,
      locations: json['locations'] as List<Location>,
      posts: json['posts'] as List<Post>,
      followers: json['followers'] as List<int>,
      followed: json['followed'] as List<int>,

    ); }
  //post location ve notification icin toJson metodu gerekli
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'posts': posts?.map((e) => e.toJson())?.toList(),
      //'followers': followers?.map((e) => e.toJson())?.toList(),
      //'followed': followers?.map((e) => e.toJson())?.toList(),
      //'locations': locations?.map((e) => e.toJson())?.toList(),
      //'notifications': notifications?.map((e) => e.toJson())?.toList(),
      'profileImg': profileImg,
      'bio': bio,
      'username': username,
      'email': email,
      'postCount': postCount,

    };
  }
}


List<int> follow0 = [1];

List<int> follow1 = [0];

List<User> users = [
  User(
    username: "badboy",
    email: "badboy@gmail.com",
    followed: follow0,
    followers: follow0,
    id: 0,
    posts: user_post_0,
    profileImg: "https://images.unsplash.com/photo-1521575107034-e0fa0b594529?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9zdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    locations: locations,
    notifications: notifications,
    bio:"General Kenobi ?",
  ),
  User(
    username: "Thedox",
    email: "Thedox@gmail.com",
    followed: follow1,
    followers: follow1,
    id: 1,
    posts: user_post_1,
    profileImg: "https://pbs.twimg.com/profile_images/1385135288607969281/mykyCd8J_400x400.jpg",
    locations: locations,
    notifications: notifications,
    bio:"Tatildeyim, yokum",
  ),

];


List<Comment> comments1 = [
  Comment(
    username: "badboy",
    commentBody: "First",
    userImageUrl : 'assets/pp1.jpg',
    postID: 1,
    timeago : '10 mins',
  ),
  Comment(
    username: "badgirl",
    commentBody: "Second",
    userImageUrl : 'assets/pp2.jpg',
    postID: 2,
    timeago : '15 mins',
  ),
  Comment(
    username: "goodboy",
    commentBody: "Third",
    userImageUrl : 'assets/pp3.jpg',
    postID: 3,
    timeago : '20 mins',
  )

];

List<Comment> comments2 = [
  Comment(
    username: "badboy",
    commentBody: "1 image",
    userImageUrl : 'assets/pp1.jpg',
    postID: 1,
    timeago : '10 mins',
  ),
  Comment(
    username: "badgirl",
    commentBody: "2 image",
    userImageUrl : 'assets/pp2.jpg',
    postID: 2,
    timeago : '15 mins',
  ),
  Comment(
    username: "goodboy",
    commentBody: "3 image",
    userImageUrl : 'assets/pp3.jpg',
    postID: 3,
    timeago : '20 mins',
  )

];

List<Comment> comments3 = [
  Comment(
    username: "badboy",
    commentBody: "nice ",
    userImageUrl : 'assets/pp1.jpg',
    postID: 1,
    timeago : '10 mins',
  ),
  Comment(
    username: "badgirl",
    commentBody: "good ",
    userImageUrl : 'assets/pp2.jpg',
    postID: 2,
    timeago : '15 mins',
  ),
  Comment(
    username: "goodboy",
    commentBody: "meeeh",
    userImageUrl : 'assets/pp3.jpg',
    postID: 3,
    timeago : '20 mins',
  )
];