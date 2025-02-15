import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///helper function for cloud-related operations
class CloudHelperFunctions{


  /// helper function to check the state of database record
  /// returns a widget base on the state of the snapshot
  /// If data is still loading, it returns a circular progress indicator.
  /// If no data is found, it returns a generic error "no data found" message.
  /// if errors occurs, it returns a generic error message
  /// otherwise, it returns null.


  static Widget? checkSingleRecordStatus<T>(AsyncSnapshot<T> snapShot){
    if(snapShot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapShot.hasData || snapShot.data == null){
      return const Center(child: Text('No data found'));
    }

    if(snapShot.hasError){
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }

  static Widget? checkMultiRecordStatus<T>({required AsyncSnapshot<List<T>> snapShot, Widget? loader, Widget? error, Widget? nothingFound}){
    if(snapShot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapShot.hasData || snapShot.data == null || snapShot.data!.isEmpty){
      if(nothingFound != null) return nothingFound;
      return const Center(child: Text('No data found'));
    }

    if(snapShot.hasError){
      if(error != null) return error;
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }

  /// create a reference with an initial file path and name retrieve the download URL
  static Future<String> getURLFromFilePathAndName(String path) async{
    try{
      if(path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    }on FirebaseException catch(e){
      throw e.message!;
    } on PlatformException catch(e){
      throw e.message!;

    } catch(e){
      throw 'Something went wrong';
    }
  }

}