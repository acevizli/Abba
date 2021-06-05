import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/db/StorageRepository.dart';
import 'package:provider/provider.dart';
import 'package:image_cropper/image_cropper.dart';

import 'ImageHelper.dart';
class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key key, this.analytics, this.observer,this.storageRepository}) : super(key: key);
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  final StorageRepository storageRepository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
        child: Text('select'),
        onPressed:() async {
          final pickedFile = await ImageHelper.pickImageFromGallery(
          context: context,
          cropStyle: CropStyle.rectangle,
          title: 'Create Post',
          );
          if (pickedFile != null) {
          storageRepository.uploadPostImage(image: pickedFile);
          }
        },
        ),
      ),
    );
  }
  void _selectPostImage(BuildContext context)  async{
    print('bruh');
    final pickedFile = await ImageHelper.pickImageFromGallery(
      context: context,
      cropStyle: CropStyle.rectangle,
      title: 'Create Post',
    );
    if (pickedFile != null) {
      storageRepository.uploadPostImage(image: pickedFile);
    }
  }
}