import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);
  final box = GetStorage('BonsPreco');
  //static String root = Conexao().getImgUser();
  RxBool loading = true.obs;

  @override
  Widget build(BuildContext context) {
    String name = '';
    String contacto = '';
    String email = '';
    RxString urlImage = 'assets/user.png'.obs;

    return Drawer(
      child: Material(
        color: Layout.primary(),
        child: ListView(
          padding: const EdgeInsets.only(
              //top: 2,
              //left: 5,
              //right: 5,
              ),
          children: [
            buildHeader(
              name: "Bons Preços",
            ),
            const SizedBox(height: 13),
            buildMenuItem(
              text: 'Minhas Reservas',
              icon: Icons.shopping_cart,
              onClicked: () {
                Get.toNamed(Routes.MINHAS_RESERVAS);
              },
            ),
            buildMenuItem(
              text: 'Login',
              icon: Icons.login,
              onClicked: () {
                Get.toNamed(Routes.LOGIN);
              },
            ),
            buildMenuItem(
              text: 'Criar Conta',
              icon: Icons.account_box,
              onClicked: () {
                Get.toNamed(Routes.CRIAR_CONTA);
              },
            ),
            buildMenuItem(
              text: 'Criar Loja',
              icon: Icons.shopify,
              onClicked: () {
                Get.toNamed(Routes.CRIAR_LOJA);
              },
            ),
            buildMenuItem(
              text: 'Minha Loja',
              icon: Icons.shopify,
              onClicked: () {
                Get.toNamed(Routes.MINHA_LOJA);
              },
            ),
            buildMenuItem(
              text: 'Ver Lojas',
              icon: Icons.add_business,
              onClicked: () {
                Get.toNamed(Routes.VER_LOJA);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: color,
          fontSize: 17,
        ),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  buildHeader({
    required String name,
  }) =>
      Container(
        padding: padding.add(
          const EdgeInsets.only(
            top: 18,
            bottom: 8,
          ),
        ),
        color: Layout.dark(.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Layout.primaryWhite(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
