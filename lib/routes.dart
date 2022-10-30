import 'package:block_validation/screens/crud/bloc_crud_screen.dart';
import 'package:block_validation/screens/get_post/post_api_screen.dart';
import 'package:block_validation/screens/otp/otp_screen.dart';

getRoutes() {
  return {
    "/": (context) => const OtpScreen(),
    "bloc-crud": (context) => const CrudScreen(),
    "post-api": (context) => const PostApiScreen(),
  };
}
