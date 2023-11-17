import 'package:nexle_corporation/core/view_models/screens/implements/auth_viewmodel.dart';
import 'package:nexle_corporation/core/view_models/screens/implements/category_viewmodel.dart';
import 'package:nexle_corporation/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../core/view_models/screens/interfaces/icategory_viewmodel.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IAuthViewModel>(
    create: (_) => AuthViewModel(),
  ),
  ChangeNotifierProvider<ICategoryViewModel>(
    create: (_) => CategoryViewModel(),
  ),
];
