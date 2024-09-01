import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/layout_view.dart';

import '../../core/firebase_utils.dart';
import '../../core/page_route_names.dart';
import '../../core/settings_provider.dart';
import '../../services/snack_bar_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscured = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffDFECDB),
        image: DecorationImage(image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            lang!.login,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: mediaQuery.size.height*0.2 ),
                     Text(
                      lang.welcome,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                      ),

                    ),
                    const SizedBox(height: 20 ),
                        TextFormField(
                          controller: emailController,
                          cursorColor: theme.primaryColor,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return lang.pleaseEnterYourName;
                            }
                            var regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if(!regex.hasMatch(value)){
                              return "invalid email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              lang.email,
                              style: theme.textTheme.displayLarge?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            hintText: lang.pleaseEnterYourEmail,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              )
                            ),
                            suffixIcon: const Icon(Icons.email,color: Colors.black54,),
                          ),
                    ),
                    const SizedBox(height: 10 ),
                    TextFormField(
                      controller: passwordController,
                      cursorColor: theme.primaryColor,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      obscureText: isObscured,
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return lang.pleaseEnterYourPassword;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text(
                          lang.password,
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        hintText: lang.pleaseEnterYourPassword,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )
                        ),
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                            child: Icon(
                                isObscured?
                                Icons.visibility :
                                Icons.visibility_off,
                              color: Colors.black54,

                            )),
                      ),
                    ),
                    const SizedBox(height: 20 ),
                     Text(
                      lang.forgetPassword,
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 60 ),
                    FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FirebaseUtils.signIn(
                                emailController.text, passwordController.text).
                            then((value) => {
                              if(value){
                                EasyLoading.dismiss(),
                                SnackBarService.showSuccessMessage("Login successfully!"),
                                Navigator.pushReplacementNamed(context, PageRouteNames.layout)
                              }
                            });
                          }
                        },

                        style: FilledButton.styleFrom(
                          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 12) ,
                          backgroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                           lang.login,
                      style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white
                      ),
                    ),
                            const Icon(Icons.arrow_forward,size: 30,)
                          ],
                        )),
                    const SizedBox(height: 40 ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(
                            context, PageRouteNames.register
                        );
                      },
                      child: Text(
                        lang.createAnAccount,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
        ),
    );
  }
}