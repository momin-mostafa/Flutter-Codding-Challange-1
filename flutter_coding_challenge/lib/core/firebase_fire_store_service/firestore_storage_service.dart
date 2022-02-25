import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class StorageController extends GetxController {
  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();
  String? imageUrl;
  XFile? image;
  void uploadImage() async {
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.pickImage(
          source: ImageSource.gallery, maxHeight: 300, maxWidth: 300);

      var file = image;
      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await _storage.ref().child('folderName/imageName').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        imageUrl = downloadUrl;
      } else {
        Get.snackbar('no path recived', 'No Path Received' 'message');
      }
    } else {
      Get.snackbar('Grant Permissions', 'Grant Permissions and try again');
    }
  }
}
