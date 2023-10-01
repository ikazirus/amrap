import 'package:amrap/features/amrap/view_models/amrap_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final amrapChangeNotifierProvider =
    ChangeNotifierProvider((ref) => AmrapViewModel());
