import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get.config.dart';
///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 10:50
///

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);