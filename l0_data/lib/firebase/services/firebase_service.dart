import 'package:firebase_core/firebase_core.dart';
import 'package:l0_data/firebase/firebase_options.dart';
import 'package:l0_data/firebase/services/i_firebase_service.dart';

class FirebaseService implements IFirebaseService {
  @override
  Future initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
