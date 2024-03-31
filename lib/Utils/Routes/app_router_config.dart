import 'package:codeEditor/View/Pages/HomeScreen/home.dart';
import 'package:codeEditor/View/Pages/ProblemScreen/problem_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const Home();
        },
        routes: [
          GoRoute(
            path: 'question',
            builder: (context, state) {
              Map<String, dynamic> objects =
                  state.extra as Map<String, dynamic>;

              return ProblemScreen(
                topic: objects['topic'],
                problem: objects['problem'],
              );
            },
          )
        ])
  ]);
}
