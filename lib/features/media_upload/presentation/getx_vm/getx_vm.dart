import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_libs/core/env/base_url.dart';

import '../../../../core/media_picker/image_picker_media_picker.dart';
import '../../../../core/media_picker/media_picker.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/data_source/remote_data_source/dio_media_upload_data_source.dart';
import '../../data/data_source/remote_data_source/http_generate_media_url_data_source.dart';
import '../../data/model/acknowledgement_response.dart';
import '../../data/model/upload_response_model.dart';
import '../../data/repository/media_upload_repository_impl.dart';
import '../../domain/entity/attachment_entity.dart';
import '../../domain/usecase/generate_media_url_usecase.dart';
import '../../domain/usecase/upload_media_usecase.dart';

class UploadMediaVM extends GetxController {
  late Usecase<UploadMediaResponse> uploadMediaUsecase;
  late Usecase<AcknowledgementResponse> generateUrlUsecase;
  late MediaPicker mediaPicker;

  Future<AttachmentEntity?> uploadMedia(
      {required BaseUrl url,
      required String uploadEndpoint,
      required Map request,
      required String generateUrlEndpoint,
      bool generateUrl = true}) async {
    AttachmentEntity? myAttachment;
    uploadMediaUsecase = UploadMediaUsecase(
        repo: MediaUploadRepoImpl(
            dataSource: DioMediaUploadRemoteDataSource(
          endpoint: uploadEndpoint,
          url: url,
        )),
        generateUrlUsecase: generateUrl
            ? GenerateUrlUsecase(
                repo: MediaUploadRepoImpl(
                    dataSource: HttpGenerateMediaUrlDataSource(
                        endpoint: generateUrlEndpoint, url: url)),
              )
            : null);
    await uploadMediaUsecase.call(
        request: request,
        endpoint: uploadEndpoint,
        onSuccess: (attachment) {
          if (generateUrl) {
            myAttachment = attachment as AttachmentEntity;
          }
        },
        onFaliure: (statusCode, msg) {},
        onAuthFailure: () {},
        onError: (error) {});
    return myAttachment;
  }

  Future<String?> generateUrl(
      {required Map request,
      required String endpoint,
      required BaseUrl url}) async {
    generateUrlUsecase = GenerateUrlUsecase(
      repo: MediaUploadRepoImpl(
          dataSource:
              HttpGenerateMediaUrlDataSource(endpoint: endpoint, url: url)),
    );
    return await (generateUrlUsecase as GenerateUrlUsecase)
        .generateUrl(request: request);
  }

  Future<AttachmentEntity?> uploadImage(
      {required BaseUrl url,
      required String uploadEndpoint,
      required Map request,
      required String generateUrlEndpoint,
      required int attachmentType,
      Map data = const {},
      fromGallery = false}) async {
    mediaPicker = ImagePickerMediaPicker(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);
    XFile? xfile = await mediaPicker.pickMedia();
    if (xfile != null) {
      return uploadMedia(
        url: url,
        uploadEndpoint: uploadEndpoint,
        generateUrlEndpoint: generateUrlEndpoint,
        request: {
        "data": data,
        "path": mediaPicker.getPath(xfile).toString(),
        "fileType": attachmentType
      });
    }
    return null;
  }

  // String getGenerateProfilePicLink(ProfileEntity? profileEntity) {
  //   String emptyLink = "";

  //   if (profileEntity == null) {
  //     return emptyLink;
  //   }

  //   profileEntity = profileEntity as ProfileEntityImpl;

  //   if (profileEntity.attachment == null) {
  //     return emptyLink;
  //   }

  //   if ((profileEntity.attachment!.isEmpty ||
  //       profileEntity.attachment!.first == null)) {
  //     return emptyLink;
  //   }

  //   Attachment att = profileEntity.attachment!.first as Attachment;
  //   return att.link.toString();
  // }
}
