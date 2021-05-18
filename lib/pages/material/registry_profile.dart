import 'package:flutter/material.dart';
// import 'package:yandra_app/components/date_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yandra_app/components/date_picker.dart';

class RegistryProfile extends StatefulWidget {
  @override
  RegistryProfileState createState() => RegistryProfileState();
}

class RegistryProfileState extends State<RegistryProfile> {
  final maskFormatter = MaskTextInputFormatter(mask: '(##) # ####-####');
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Registro de Perfil'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
          // body: Container(
          // child: Center()
          // child: Column();
          // child: SingleChildScrollView(

          child: Container(
        height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/womanback.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        // margin: EdgeInsets.all(20),
        // padding: EdgeInsets.only(top: 20),
        // child: (Center(
        child: Column(
          children: [
            Text(
              'Insira as Informações para concluir seu Cadastro!',
              textAlign: TextAlign.center,
              style: TextStyle(
                // letterSpacing: 3,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColor,
              ),
            ),
            // SizedBox(
            //   height: 140,
            // ),
            TextField(
              autocorrect: false,
              autofocus: false,
              cursorColor: Theme.of(context).primaryColor,
              maxLength: 60,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                suffixIcon: Icon(Icons.person_outline,
                    color: Theme.of(context).primaryColor, size: 35),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                labelText: "Nome Completo:",
                labelStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                suffixIcon: Icon(Icons.phone_outlined,
                    color: Theme.of(context).primaryColor, size: 35),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                labelText: "Telefone:",
                labelStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
              inputFormatters: [maskFormatter],
            ),
            DatePicker(context: context),
            // SizedBox(
            //   height: 250,
            // ),
            RaisedButton(
              onPressed: () {
                print({maskFormatter.getMaskedText()});
                print(maskFormatter.getUnmaskedText());
                print(numberController.text);
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 14),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "CONCLUIR",
                style: TextStyle(
                    fontSize: 16, letterSpacing: 2.2, color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
