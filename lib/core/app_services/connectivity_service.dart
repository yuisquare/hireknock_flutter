// import 'package:hasura_connect/hasura_connect.dart';
// import 'package:quizly_api_service/app_constants/app_snackbar.dart';
// import 'package:quizly_api_service/app_services/connectivity_service.dart';
// import 'package:quizly_api_service/utils/logger.dart';

// class HasuraInterceptor extends Interceptor {
//   final bool isLoggedIn;
//   HasuraInterceptor(this.isLoggedIn);

//   @override
//   Future<void>? onConnected(HasuraConnect connect) {
//     Logger.info('Hasura connected');
//     return null;
//   }

//   @override
//   Future<void>? onDisconnected() {
//     Logger.info('Hasura disconnected');
//     return null;
//   }

//   @override
//   Future? onError(HasuraError request, HasuraConnect connect) {
//     AppSnackbar.show(message: 'Something went wrong');
//     Logger.error(request.message);
//     return null;
//   }

//   @override
//   Future<Request?> onRequest(Request request, HasuraConnect connect) async {
//     bool isNetWorkConnected = await ConnectivityService.isConnected();
//     if (!isNetWorkConnected) {
//       AppSnackbar.show(message: 'You are offline');
//       return null;
//     } else if (!isLoggedIn) {
//       AppSnackbar.show(message: 'You are logged out');
//       return null;
//     } else {
//       return request;
//     }
//   }

//   @override
//   Future? onResponse(Response data, HasuraConnect connect) async {
//     return data;
//   }

//   @override
//   Future<void>? onSubscription(Request request, Snapshot snapshot) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void>? onTryAgain(HasuraConnect connect) {
//     Logger.info('Hasura retrying');
//     return null;
//   }
// }
