import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:legrandweb_test_ui/components/buttons.dart';
import 'package:legrandweb_test_ui/components/forms.dart';
import 'package:legrandweb_test_ui/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneFieldController = TextEditingController(),
      _passwordController = TextEditingController();
  String countryCode = "+237";
  bool passwordObscur = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            Text(
              'Numéro de téléphone*',
              style: TextStyle(
                fontSize: 13,
                color: kTextColor,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Forms.phoneField(
              context,
              _phoneFieldController,
              TextButton(
                  onPressed: () {
                    showCountryPicker(
                        context: context,
                        countryListTheme: const CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        onSelect: (Country country) => setState(() {
                              countryCode = '+${country.phoneCode}';
                            }));
                  },
                  child: Text(
                    countryCode,
                    style: TextStyle(
                      color: kPrimaryItemColor,
                      fontSize: 15,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            Text(
              'Mot de passe*',
              style: TextStyle(
                fontSize: 13,
                color: kTextColor,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Forms.passwordField(
              context,
              _passwordController,
              passwordObscur,
              GestureDetector(
                onTap: () => setState(() => passwordObscur = !passwordObscur),
                child: Icon(
                  passwordObscur ? Icons.visibility_off : Icons.visibility,
                  color: kPrimaryItemColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Mot de passe oublié?',
                    style: TextStyle(
                      color: kPrimaryItemColor,
                      fontFamily: 'Product Sans',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            const SizedBox(height: 30),
            Buttons.authButton(() => {}, 'CONNEXION'),
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Divider(
                    color: Color(0xFF483838),
                    thickness: 2,
                  ),
                ),
                Text(
                  '   Ou   ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 13,
                    color: Color(0xFF472D2D),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Divider(
                    color: Color(0xFF483838),
                    thickness: 2,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons.buildOtherLoginCard(
                    () => {}, Image.asset('assets/images/google.png')),
                Buttons.buildOtherLoginCard(
                    () => {}, Image.asset('assets/images/facebook.png')),
                Buttons.buildOtherLoginCard(
                    () => {}, Image.asset('assets/images/apple.png')),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vous n\'avez pas de compte? ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0xFF555555),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'INSCRIVEZ VOUS ICI',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xFF4CB050),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Color(0xFF555555),
                ),
                children: [
                  TextSpan(
                      text: 'En cliquant sur connexion, j\'ai lu et accepté '),
                  TextSpan(
                    text: 'les conditions d\'utilisation ',
                    style: TextStyle(color: Color(0xFF5665CA)),
                  ),
                  TextSpan(text: 'et j\'ai pris connaissance de '),
                  TextSpan(
                    text: 'la politique de confidentialité.\n',
                    style: TextStyle(color: Color(0xFF5665CA)),
                  ),
                  TextSpan(text: 'J\'ai au moins 18 ans.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
