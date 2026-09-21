import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mon_premier_projet/features/auth/pages/login_page.dart';
import 'package:mon_premier_projet/features/auth/providers/auth_notifier.dart';


// import '../../features/produits/pages/produit_page.dart';
// import '../../features/caisse/pages/caisse_page.dart';

import 'package:mon_premier_projet/features/categories/pages/categorie_page.dart';


final routerProvider = Provider<GoRouter>((ref) {
  // On écoute l'état d'authentification pour sécuriser les routes
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    // Redirection globale de sécurité
    redirect: (context, state) {
      final bool isLoggedIn = authState.isAuthenticated;
      final bool isLoggingIn = state.matchedLocation == '/login';

      // Si l'utilisateur n'est pas connecté et essaie d'aller ailleurs -> /login
      if (!isLoggedIn && !isLoggingIn) return '/login';

      // Si l'utilisateur est connecté et essaie d'aller sur /login -> /categories (ou caisse)
      if (isLoggedIn && isLoggingIn) return '/categories';

      return null; // Pas de redirection nécessaire
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriePage(),
      ),
      GoRoute(
        path: '/produits',
        // builder: (context, state) => const ProduitPage(),
      ),
      GoRoute(
        path: '/caisse',
        // builder: (context, state) => const CaissePage(),
      ),
    ],
  );
});