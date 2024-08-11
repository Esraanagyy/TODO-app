import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget{
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscured = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);

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
          title: const Text(
              "Create account"
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
                  TextFormField(
                    controller: userController,
                    cursorColor: theme.primaryColor,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "please enter your full name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "User name",
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      hintText: "please enter your full name",
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                      ),
                      suffixIcon: const Icon(Icons.person,color: Colors.black54,),
                    ),
                  ),
                  const SizedBox(height: 10 ),
                  TextFormField(
                    controller: emailController,
                    cursorColor: theme.primaryColor,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "please enter your email";
                      }
                      var regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if(!regex.hasMatch(value)){
                        return "invalid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "E-mail",
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      hintText: "please enter your email address",
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
                        return "please enter your password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      hintText: "please enter your password",
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
                  const SizedBox(height: 60 ),
                  FilledButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      print("valid")  ;
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
                            "Create account",
                            style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white
                            ),
                          ),
                          const Icon(Icons.arrow_forward,size: 30,)
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}