import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/provider/parceiro.provider.dart';
import 'package:bompreco/app/data/repository/parceiro.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);
  final box = GetStorage('BonsPreco');
  User user = User();

  Parceiro parceiro = Parceiro();
  RxList<Parceiro> listParceiro = <Parceiro>[].obs;
  ParceiroRepository parceiroRepository = ParceiroRepository();

  //static String root = Conexao().getImgUser();
  RxString token = ''.obs;

  @override
  Widget build(BuildContext context) {
    String name = '';
    String contacto = '';
    String email = '';
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
      name = user.nome.toString();
      contacto = user.contacto.toString();
      email = user.email.toString();
      token.value = box.read('accessToken');
    } else {
      name = "Bons Preços";
      contacto = '900 000 000';
      email = 'abc@bonspreco.com';
    }

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
              name: name,
              email: email,
              contacto: contacto,
            ),
            const SizedBox(height: 13),
            buildMenuItem(
              text: 'Minhas Reservas',
              icon: Icons.shopping_cart,
              onClicked: () {
                if (user.id != null) {
                  Get.toNamed(Routes.MINHAS_RESERVAS);
                } else {
                  Conexao().dialogSMS(
                      'Aviso!', "Porfavor faça um Login ou Criar uma conta!");
                }
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
                if (user.id != null) {
                  Get.toNamed(Routes.CRIAR_LOJA);
                } else {
                  Conexao().dialogSMS(
                      'Aviso!', "Porfavor faça um Login ou Criar uma conta!");
                }
              },
            ),
            buildMenuItem(
              text: 'Minha Loja',
              icon: Icons.shopify,
              onClicked: () async {
                if (user.id != null) {
                  listParceiro.value = await parceiroRepository
                      .parceiroSelectUser(user.id.toString(), token.value);

                  if (listParceiro.isNotEmpty) {
                    if (listParceiro[0].donoIdUser == user.id!) {
                      box.write('Parceiro', listParceiro[0]);
                      Get.toNamed(Routes.MINHA_LOJA);
                    } else {
                      Conexao()
                          .dialogSMS('Aviso!', "Não tens uma Loja criada!");
                    }
                  } else {
                    Conexao().dialogSMS('Aviso!', "Não tens uma Loja criada!");
                  }
                } else {
                  Conexao().dialogSMS(
                      'Aviso!', "Porfavor faça um Login ou Criar uma conta!");
                }
              },
            ),
            buildMenuItem(
              text: 'Ver Lojas',
              icon: Icons.add_business,
              onClicked: () {
                Get.toNamed(Routes.VER_LOJA);
              },
            ),
            buildMenuItem(
              text: 'Gestor',
              icon: Icons.admin_panel_settings,
              onClicked: () {
                if (int.parse(user.gestor.toString()) == 1) {
                  Get.toNamed(Routes.ADMIN);
                }
              },
            ),
            buildMenuItem(
              text: 'Sair',
              icon: Icons.close,
              onClicked: () {
                Conexao().logout();
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

  buildHeader(
          {required String name,
          required String email,
          required String contacto}) =>
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  contacto,
                  style: TextStyle(
                    color: Layout.primaryWhite(),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Layout.primaryWhite(),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
