/*
* Router to Navigate between different Screens
*
* This is a Singleton class
* */

class Router {
  /*
  * No public constructor allowed
  * Only private constructor to initialize object from inside
  * */
  Router._();

  static final Router instance = Router._();

  void init() {}

  final String WRAPPER = "/wrapper"; // ignore: non_constant_identifier_names
  final String SIGNUP = "/signup"; // ignore: non_constant_identifier_names
  final String HOME = "/home"; // ignore: non_constant_identifier_names
  final String SPLASH = "/splash"; // ignore: non_constant_identifier_names
  final String BOOKING = "/online_appointment"; // ignore: non_constant_identifier_names
  final String BABY = "/baby"; // ignore: non_constant_identifier_names
  final String CLINIC = "/clinic_rating"; // ignore: non_constant_identifier_names
  final String VIDEO = "/video"; // ignore: non_constant_identifier_names
  final String CHAT = "/chat"; // ignore: non_constant_identifier_names
}
