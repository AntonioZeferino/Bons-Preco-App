import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/parceiro.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class CriarLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  final String root = Conexao().getImgParceiro();
  final formkey = GlobalKey<FormState>();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController contactoCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController horarioCtrl = TextEditingController();
  TextEditingController entregasCtrl = TextEditingController();
  TextEditingController enderecoCtrl = TextEditingController();
  TextEditingController password1Ctrl = TextEditingController();
  TextEditingController password2Ctrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  RxBool valor = false.obs;
  RxString token = ''.obs;

  User user = User();
  Parceiro parceiro = Parceiro();
  ParceiroRepository repository = ParceiroRepository();

  RxInt verImg1 = 0.obs;
  RxInt idParceiroActualiz = 0.obs;
  Rx<XFile> image1 = XFile('').obs;
  RxBool isPicked1 = false.obs;

  @override
  void onInit() {
    //pegarUser();
    user = User.fromJson(box.read('user'));
    token.value = box.read('accessToken');
    super.onInit();
  }

  setParceiro() async {
    bool res = false;
    if (image1.value.path.isNotEmpty) {
      if (nomeCtrl.text.toString().isNotEmpty &&
          contactoCtrl.text.toString().isNotEmpty &&
          emailCtrl.text.toString().isNotEmpty &&
          horarioCtrl.text.toString().isNotEmpty &&
          enderecoCtrl.text.toString().isNotEmpty) {
        loading.value = true;
        parceiro.id = idParceiroActualiz.value;
        parceiro.donoIdUser = user.id;
        parceiro.nome = nomeCtrl.text.toString();
        parceiro.contacto = contactoCtrl.text.toString();
        parceiro.email = emailCtrl.text.toString();
        parceiro.horario = horarioCtrl.text.toString();
        parceiro.entregas = valor.value ? 1 : 0;
        parceiro.endereco = enderecoCtrl.text.toString();
        Conexao().verificaConexao();
        if (Conexao().net.value) {
          res = await repository.parceiroInsert(
              parceiro, image1.value, token.value);
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
          print("Erro Res: " + res.toString());
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

  setParceiroUpdate() async {
    bool res = false;
    if (nomeCtrl.text.toString().isNotEmpty &&
        contactoCtrl.text.toString().isNotEmpty &&
        emailCtrl.text.toString().isNotEmpty &&
        horarioCtrl.text.toString().isNotEmpty &&
        enderecoCtrl.text.toString().isNotEmpty) {
      loading.value = true;
      parceiro.id = idParceiroActualiz.value;
      parceiro.nome = nomeCtrl.text.toString();
      parceiro.contacto = contactoCtrl.text.toString();
      parceiro.email = emailCtrl.text.toString();
      parceiro.horario = horarioCtrl.text.toString();
      parceiro.entregas = valor.value ? 1 : 0;
      parceiro.endereco = enderecoCtrl.text.toString();
      Conexao().verificaConexao();
      if (Conexao().net.value) {
        res = await repository.parceiroUpdate(
            parceiro, image1.value, token.value);
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
        Conexao().dialogSMS('Parceiro', 'Actualizado com sucesso!');
        limparCampos();
      } else {
        loading.value = false;
        print("Errado Res: " + res.toString());
      }
    } else {
      loading.value = false;
      Conexao().dialogSMS('Parceiro', 'Preencha todos os campos!');
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
    contactoCtrl.text = '';
    emailCtrl.text = '';
    horarioCtrl.text = '';
    entregasCtrl.text = '';
    enderecoCtrl.text = '';
    password1Ctrl.text = '';
    password2Ctrl.text = '';
    image1 = XFile('').obs;
    verImg1 = 0.obs;
    isPicked1.value = false;
  }
}
