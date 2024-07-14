import 'package:appwrite/appwrite.dart';
import '../core/constants/app_write.dart';
import 'package:tendollarapp/provider/provider.dart';
import 'package:tendollarapp/enum/notificton_type_enum.dart';
import 'package:tendollarapp/models/notification_model.dart';

class NotificationApi {
  static final Databases db = AppWriteProvider().getDatabases;
  // static final Realtime _realtime = AppWriteProvider().getReatime;

  static addnotification({
    required String text,
    required String uid,
    required String postId,
    required NotificationType notificationType,
  }) async {
    try {
      NotificationModel notification = NotificationModel(
          isSeen: false,
          id: "",
          notificationType: notificationType,
          postId: postId,
          text: text,
          uid: uid,
          time: DateTime.now());
      await db.createDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.notificationCollection,
          documentId: ID.unique(),
          data: notification.toMap());
    } on AppwriteException {}
  }
  // sendPushNotificationMessage(MessageModel messageModel, BuildContext context,
  //     String userId, ChatModel chatModel) async {
  //   final friendUser = await context.read<AllUserProvider>().getuserById(
  //       userId == messageModel.friendId
  //           ? messageModel.userId
  //           : messageModel.friendId);
  //   final myUser = context.read<AllUserProvider>().getuserById(
  //       userId == messageModel.friendId
  //           ? messageModel.userId
  //           : messageModel.friendId);

  //   if (friendUser != null && myUser != null) {
  //     final body = {
  //       'fromName': myUser.username,
  //       'messageType': chatModel.type,
  //       'message': chatModel.messageContent,
  //       'fromUserId': myUser.uid,
  //     };

  //     if (friendUser.firebaseToken != null) {
  //       FirePush.sendPayload(friendUser.firebaseToken!,);
  //     }
  //   }
  // }
  static Future<List<NotificationModel>> getNotification() async {
    var uid = await SecureStorage.getId();
    var d = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.notificationCollection,
        queries: [Query.equal('uid', uid)]);
    print("Noticefication ${d.documents}");
    return d.documents.map((e) => NotificationModel.fromMap(e.data)).toList();
  }

  static Future updateNotification(NotificationModel notification) async {
    print("read all bbb");
    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.notificationCollection,
        documentId: notification.id,
        data: notification.toMap());
  }
}
