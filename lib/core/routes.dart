import 'package:amrap/features/amrap/views/amrap_timer_view.dart';
import 'package:amrap/features/amrap/views/amrap_user_input_view.dart';
import 'package:amrap/features/home/views/home_view.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();

  static String home = "Home";
  static String amrapUserInput = "Amrap User Input";
  static String amrapTimer = "Amrap Timer";

  static final router = GoRouter(routes: [
    GoRoute(
        path: "/",
        name: home,
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
              path: "input",
              name: amrapUserInput,
              builder: (context, state) => const AmrapUserInputView(),
              routes: [
                GoRoute(
                  path: "timer",
                  name: amrapTimer,
                  builder: (context, state) => const AmrapTimerView(),
                ),
              ]),
        ]),
  ]);
}
