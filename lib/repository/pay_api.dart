import '../models/userModel.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite/appwrite.dart';
import 'package:tendollarapp/models/withdraw_model.dart';
import 'package:tendollarapp/core/constants/constant.dart';
import 'package:tendollarapp/enum/notificton_type_enum.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';
import 'package:tendollarapp/repository/notification_api.dart';

class Pay {
  static Databases _databases = AppWriteProvider().getDatabases;

  static Future withDrawRequest(
      {required UserModel userModel, required int amount}) async {
    int userBalance = userModel.userBalance;
    int newBalance = userBalance - amount;
    UserModel user = userModel.copyWith(userBalance: newBalance);
    WithdrawModel withdrawModel = WithdrawModel(
        id: '',
        username: userModel.username,
        bankName: userModel.bankName,
        acountNumber: userModel.accountNumber,
        accountName: userModel.accountName,
        photoUrl: userModel.photoUrl,
        uid: userModel.uid,
        amount: amount,
        isPaid: false);
    await _databases.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.withdrawdatabaseId,
        documentId: ID.unique(),
        data: withdrawModel.toMap());

    await _databases.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        documentId: userModel.uid,
        data: user.toMap());
  }

  static Future<List<WithdrawModel>> getAllwithdrawRequest() async {
    DocumentList withdraaw = await _databases.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.withdrawdatabaseId,
        queries: [Query.orderDesc("\$createdAt")]);
    List<WithdrawModel> withdraawmodels =
        withdraaw.documents.map((e) => WithdrawModel.fromMap(e.data)).toList();
    return withdraawmodels;
  }

  static Future paid(WithdrawModel withdrawModel) async {
    var w = withdrawModel.copyWith(isPaid: true);

   await _databases.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.withdrawdatabaseId,
        documentId: withdrawModel.id,
        data: w.toMap());

    NotificationApi.addnotification(
        text:
            "${withdrawModel.username}, your withdrawal request has been successfully sent to the provided account. N${withdrawModel.amount} ",
        uid: withdrawModel.uid,
        postId: withdrawModel.id,
        notificationType: NotificationType.repost);
  }
}
