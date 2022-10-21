import 'package:provider/provider.dart';
import '../screens/home_view_modal.dart';

var providers = [
  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
];
