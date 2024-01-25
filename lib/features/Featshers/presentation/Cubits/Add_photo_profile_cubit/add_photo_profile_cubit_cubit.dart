import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/cache/cachprefranses.dart';
import '../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../Auth_cubit_featsure/Auth_cubit.dart';

part 'add_photo_profile_cubit_state.dart';

class AddPhotoProfileCubitCubit extends Cubit<AddPhotoProfileCubitState> {
  AddPhotoProfileCubitCubit() : super(AddPhotoProfileCubitInitial());
  static AddPhotoProfileCubitCubit get(context) =>
      BlocProvider.of<AddPhotoProfileCubitCubit>(context);

  File? fileImage;
  var imgPicker = ImagePicker();
  var downloadURL;
  bool islurlLoading = false;
  bool fristOften = true;
  Future<void> uploadImageFrom_gallery_or_camera(context,
      {required gallery_or_camera}) async {
    var pickedImage = await imgPicker.pickImage(
        source: gallery_or_camera == "gallery"
            ? ImageSource.gallery
            : gallery_or_camera == "camera"
                ? ImageSource.camera
                : null!);

    if (pickedImage != null) {
      islurlLoading = true;
      fristOften = false;
      emit(photoloading());
      var imagePath = pickedImage.path;
      fileImage = File(imagePath);

      // Start uploading to Firebase Storage
      var storageReference = FirebaseStorage.instance.ref("images/$fileImage");
      await storageReference.putFile(fileImage!);

      downloadURL = await storageReference.getDownloadURL();

      PreferencesService.setUserName("ProfilePhoto", downloadURL);
      MAssegeSnakbarr(context, "Photo uploaded successfully", null);
      islurlLoading = false;
      emit(Added());
      print(downloadURL);

      // End uploading to Firebase Storage
    }
  }
}
