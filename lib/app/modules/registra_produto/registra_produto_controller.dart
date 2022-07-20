import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/produto.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class RegistraProdutoController extends GetxController {
  final box = GetStorage('BonsPreco');
  final String root = Conexao().getImgProduto();
  final formkey = GlobalKey<FormState>();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController contactoCtrl = TextEditingController();

  User user = User();
  Produto produto = Produto();
  ProdutoRepository repository = ProdutoRepository();

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  RxBool valor = false.obs;
  RxString token = ''.obs;

  RxInt verImg1 = 0.obs;
  RxInt idProdutoActualiz = 0.obs;
  Rx<XFile> image1 = XFile('').obs;
  RxBool isPicked1 = false.obs;

  @override
  void onInit() {
    pegarUser();
    token.value = box.read('accessToken');
    super.onInit();
  }

  pegarUser() {
    user = User.fromJson(box.read('user'));
  }

  setPedido() async {
    bool res = false;
    if (image1.value.path.isNotEmpty) {
      if (nomeCtrl.text.toString().isNotEmpty) {
        loading.value = true;
        produto.nome = nomeCtrl.text.toString();
        Conexao().verificaConexao();
        if (Conexao().net.value) {
          res = await repository.produtoInsert(
              produto, image1.value, token.value);
        } else {
          Get.snackbar(
            'Sem Internet',
            "verifica sua conexão com a internet!",
            snackPosition: SnackPosition.TOP,
            colorText: Layout.primaryWhite(),
            backgroundColor: Layout.danger(),
          );
        }

        if (res) {
          Conexao().dialogSMS('Produto', 'Enviado com sucesso!');
          loading.value = false;
          limparCampos();
        } else {
          loading.value = false;
          print("Errado Res: " + res.toString());
        }
      } else {
        loading.value = false;
        Conexao().dialogSMS('Produto', 'Preencha todos os campos!');
      }
    } else {
      loading.value = false;
      Conexao().dialogSMS('Produto', 'Porfavor selecione a Imagem!');
    }
  }

  setPedidoUpdate() async {
    bool res = false;
    if (nomeCtrl.text.toString().isNotEmpty) {
      loading.value = true;
      produto.id = idProdutoActualiz.value;
      produto.nome = nomeCtrl.text.toString();

      Conexao().verificaConexao();
      if (Conexao().net.value) {
        res =
            await repository.produtoUpdate(produto, image1.value, token.value);
      } else {
        Get.snackbar(
          'Sem Internet',
          "verifica sua conexão com a internet!",
          snackPosition: SnackPosition.TOP,
          colorText: Layout.primaryWhite(),
          backgroundColor: Layout.danger(),
        );
      }

      if (res) {
        loading.value = false;
        Conexao().dialogSMS('Produto', 'Actualizado com sucesso!');
        limparCampos();
      } else {
        loading.value = false;
        print("Errado Res: " + res.toString());
      }
    } else {
      loading.value = false;
      Conexao().dialogSMS('Produto', 'Preencha todos os campos!');
    }
  }

  bottomCamera(bool foto) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Layout.primaryWhite(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                getImage(isCamera: true);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Galeria'),
              onTap: () {
                Get.back();
                getImage(isCamera: false);
              },
            ),
          ],
        ),
      ),
    );
  }

  void getImage({required bool isCamera}) async {
    XFile? _file;

    if (isCamera) {
      _file = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      _file = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (_file!.path.isNotEmpty) {
      image1.value = XFile(_file.path);
      isPicked1.value = true;
      verImg1.value = 0;
    }
  }

  limparCampos() {
    nomeCtrl.text = '';
    image1 = XFile('').obs;
    verImg1 = 0.obs;
    isPicked1.value = false;
  }
}
