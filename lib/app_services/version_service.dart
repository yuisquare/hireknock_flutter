import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_knock/utils/logger.dart';

class VersionService{
  final FirebaseFirestore firestore;

  VersionService() : this.firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getVersion() async {
    Logger.info('getVersion: ');
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
          .collection('versionUpdates')
          .doc('institute_version')
          .get();
      if (documentSnapshot.data() != null &&
          documentSnapshot.data()!.isNotEmpty) {
        Map<String, dynamic>? map = documentSnapshot.data();
        return map;
      } else
        return null;
    } on Exception catch (e) {
      Logger.error(e);
      return null;
    }
  }
}
