import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/core/constant/constants.dart';

class CloudinaryProvider {
  Cloudinary get _cloudinary {
    final storage = Cloudinary.signedConfig(
      apiKey: cloudinaryApiKey,
      apiSecret: cloudinaryApiSecret,
      cloudName: cloudinaryCloudName,
    );
    return storage;
  }

  Future<String?> uploadImage(XFile imageFile) async {
    try {
      final imageByte = await imageFile.readAsBytes();
      final result = await _cloudinary.upload(
        folder: 'product_images',
        file: imageFile.path,
        fileBytes: imageByte,
        fileName: DateTime.now().toIso8601String(),
        resourceType: CloudinaryResourceType.image,
      );

      return result.url;
    } catch (_) {
      rethrow;
    }
  }
}
