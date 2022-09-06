import 'package:bompreco/app/modules/add_produto_loja/add_produto_loja_binding.dart';
import 'package:bompreco/app/modules/add_produto_loja/add_produto_loja_view.dart';
import 'package:bompreco/app/modules/admin/admin_binding.dart';
import 'package:bompreco/app/modules/admin/admin_view.dart';
import 'package:bompreco/app/modules/bemvindo/bemvindo_binding.dart';
import 'package:bompreco/app/modules/bemvindo/bemvindo_view.dart';
import 'package:bompreco/app/modules/criar_conta/criar_conta_binding.dart';
import 'package:bompreco/app/modules/criar_conta/criar_conta_view.dart';
import 'package:bompreco/app/modules/criar_loja/criar_loja_binding.dart';
import 'package:bompreco/app/modules/criar_loja/criar_loja_view.dart';
import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_binding.dart';
import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_view.dart';
import 'package:bompreco/app/modules/home/home_binding.dart';
import 'package:bompreco/app/modules/home/home_view.dart';
import 'package:bompreco/app/modules/login/login_binding.dart';
import 'package:bompreco/app/modules/login/login_view.dart';
import 'package:bompreco/app/modules/minha_loja/minha_loja_binding.dart';
import 'package:bompreco/app/modules/minha_loja/minha_loja_view.dart';
import 'package:bompreco/app/modules/minhas_reservas/minhas_reservas_binding.dart';
import 'package:bompreco/app/modules/minhas_reservas/minhas_reservas_view.dart';
import 'package:bompreco/app/modules/produto_loja/produto_loja_binding.dart';
import 'package:bompreco/app/modules/produto_loja/produto_loja_view.dart';
import 'package:bompreco/app/modules/registra_produto/registra_produto_binding.dart';
import 'package:bompreco/app/modules/registra_produto/registra_produto_view.dart';
import 'package:bompreco/app/modules/search/search_binding.dart';
import 'package:bompreco/app/modules/search/search_view.dart';
import 'package:bompreco/app/modules/ver_loja/ver_loja_binding.dart';
import 'package:bompreco/app/modules/ver_loja/ver_loja_view.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.BEMVINDO,
      page: () => const BemvindoView(),
      binding: BemvindoBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.PRODUTO_LOJA,
      page: () => const ProdutoLojaView(),
      binding: ProdutoLojaBinding(),
    ),
    GetPage(
      name: Routes.DETALHES_LOJA,
      page: () => const DetalhesLojaView(),
      binding: DetalhesLojaBinding(),
    ),
    GetPage(
      name: Routes.CRIAR_LOJA,
      page: () => const CriarLojaView(),
      binding: CriarLojaBinding(),
    ),
    GetPage(
      name: Routes.CRIAR_CONTA,
      page: () => const CriarContaView(),
      binding: CriarContaBinding(),
    ),
    GetPage(
      name: Routes.VER_LOJA,
      page: () => const VerLojaView(),
      binding: VerLojaBinding(),
    ),
    GetPage(
      name: Routes.MINHA_LOJA,
      page: () => const MinhaLojaView(),
      binding: MinhaLojaBinding(),
    ),
    GetPage(
      name: Routes.REGISTRA_PRODUTO,
      page: () => const RegistraProdutoView(),
      binding: RegistraProdutoBinding(),
    ),
    GetPage(
      name: Routes.ADD_PRODUTO_LOJA,
      page: () => const AddProdutoLojaView(),
      binding: AddProdutoLojaBinding(),
    ),
    GetPage(
      name: Routes.MINHAS_RESERVAS,
      page: () => const MinhasReservasView(),
      binding: MinhasReservasBinding(),
    ),
    GetPage(
      name: Routes.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
  ];
}
