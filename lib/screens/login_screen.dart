import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zignut_practicle/bloc/login_bloc.dart';
import 'package:zignut_practicle/model/login_model.dart';
import 'package:zignut_practicle/model/sign_up_model.dart';
import 'package:zignut_practicle/widget/CustomToggleButton.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  int selectedIndex = 0;
  bool terms = false;
  TextEditingController emailController = TextEditingController(text: 'sudhird@zignuts.com');
  TextEditingController passwordController = TextEditingController(text: '1234567');
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  final _formKeySignUp = GlobalKey<FormState>();
  AutovalidateMode autoValidateSignUp = AutovalidateMode.disabled;

  LoginModel loginModel = LoginModel();
  SignUpModel signUpModel = SignUpModel();

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(90.0)),
      borderSide: BorderSide(
        color: Colors.white,
      )
  );


  @override
  Widget build(BuildContext context) {
    loginModel.categoryId ??= '1';
    loginModel.deviceType ??= 'A';
    loginModel.deviceToken ??= 'DummyToken';

    signUpModel.categoryId ??= '1';
    signUpModel.deviceType ??= 'A';
    signUpModel.deviceToken ??= 'DummyToken';
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Element 3",style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),),
                    centerTitle: true,
                    background: Image.asset(
                      "assets/ic_login_signup_hader.png",
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Log In"),
                      Tab(text: "Sign Up"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state is LoginErrorState){
                Fluttertoast.showToast(
                    msg: state.errorMessage,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              } else if(state is LoginSuccessState){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              } else if(state is SignUpSuccessState){
                Fluttertoast.showToast(
                    msg: 'Sign Up success',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              }
            },
            builder: (context, state) {
              return TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: autoValidate,
                      child: ListView(
                        children: [

                          SizedBox(height: 20,),

                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            child: CustomToggle(
                              listOfTitle: [
                                'Customer',
                                'Instructor'
                              ],
                              switchValue: selectedIndex,
                              onStatusChanged: (value) {
                                setState(() {
                                  selectedIndex = value;
                                  loginModel.categoryId = (value + 1).toString();
                                });
                              },
                              color: Colors.black38,
                              selectedColor: Colors.white,
                            ),
                          ),

                          SizedBox(height: 20,),

                          TextFormField(
                            controller: emailController,
                            onSaved: (val){
                              loginModel.email = val;
                            },
                            validator: (email) =>
                            !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email) ? "Enter Valid Email" : null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Log in/Mail.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),
                                hintText: 'Email'),
                          ),

                          SizedBox(height: 10,),

                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            onSaved: (val){
                              loginModel.password = val;
                            },
                            validator: (password) {
                              if (password.isEmpty) {
                                return 'Enter valid password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Log in/Password.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'Password'),
                          ),

                          SizedBox(height: 10,),

                          Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password ?', style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlue),)),

                          SizedBox(height: 15,),

                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.2,
                            height: 40,
                            child: ElevatedButton(
                                child: Text(
                                    "Log in".toUpperCase(),
                                    style: TextStyle(fontSize: 14)
                                ),
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<
                                        Color>(Colors.white),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.lightBlue),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        )
                                    )
                                ),
                                onPressed: (){
                                  if(_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(SignInEvent(loginModel));
                                  }else{
                                    autoValidate = AutovalidateMode.always;
                                  }
                                }
                            ),
                          ),

                          SizedBox(height: 10,),
                          Center(
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Don\'t have an account?',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.lightBlue),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' Sign up',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.bold))
                                      ]))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: _formKeySignUp,
                      autovalidateMode: autoValidateSignUp,
                      child: ListView(
                        children: [

                          SizedBox(height: 20,),

                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            child: CustomToggle(
                              listOfTitle: [
                                'Customer',
                                'Instructor'
                              ],
                              switchValue: selectedIndex,
                              onStatusChanged: (value) {
                                setState(() {
                                  selectedIndex = value;
                                  signUpModel.categoryId = (value + 1).toString();
                                });
                              },
                              color: Colors.black38,
                              selectedColor: Colors.white,
                            ),
                          ),

                          SizedBox(height: 20,),

                          TextFormField(
                            controller: firstNameController,
                            onSaved: (val){
                              signUpModel.firstName = val;
                            },
                            validator: (name) {
                              if (name.isEmpty) {
                                return 'Enter valid name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Sign up/First Name.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'First Name'),
                          ),

                          SizedBox(height: 10,),

                          TextFormField(
                            controller: lastNameController,
                            onSaved: (val){
                              signUpModel.lastName = val;
                            },
                            validator: (name) {
                              if (name.isEmpty) {
                                return 'Enter valid name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Sign up/First Name.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'Last Name'),
                          ),

                          SizedBox(height: 10,),

                          TextFormField(
                            onSaved: (val){
                              signUpModel.email = val;
                            },
                            validator: (email) =>
                            !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email) ? "Enter Valid Email" : null,
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Log in/Mail.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'Email'),
                          ),

                          SizedBox(height: 10,),

                          TextFormField(
                            obscureText: true,
                            onSaved: (val){
                              signUpModel.password = val;
                            },
                            controller: passwordController,
                            validator: (password) {
                              if (password.isEmpty) {
                                return 'Enter valid password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Log in/Password.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'Password'),
                          ),

                          SizedBox(height: 10,),

                          TextFormField(
                            onSaved: (val){
                              signUpModel.passwordConfirmation = val;
                            },
                            controller: confirmPasswordController,
                            obscureText: true,
                            validator: (password) {
                              if (passwordController.text != password || passwordController.text.isEmpty) {
                                return 'Enter valid password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/Login Signup Android/Log in/Password.png',
                                    height: 15,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.lightBlue),

                                hintText: 'Confirm Password'),
                          ),

                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                terms = !terms;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(terms
                                          ? 'assets/Login Signup Android/Sign up/selected.png'
                                          : 'assets/Login Signup Android/Sign up/Unselected.png')),
                                  SizedBox(width: 5,),
                                  RichText(
                                      text: TextSpan(
                                          text: 'I here by accept the ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.lightBlue),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Terms and Conditions \n',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.lightBlue,
                                                    fontWeight: FontWeight.bold)),
                                            TextSpan(
                                                text: 'and Have Read ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.lightBlue,)),
                                            TextSpan(
                                                text: 'privacy policy',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.lightBlue,
                                                    fontWeight: FontWeight.bold)),
                                          ])),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),

                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.2,
                            height: 40,
                            child: ElevatedButton(
                                child: Text(
                                    "Sign Up".toUpperCase(),
                                    style: TextStyle(fontSize: 14)
                                ),
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<
                                        Color>(Colors.white),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.lightBlue),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        )
                                    )
                                ),
                                onPressed: () {
                                  if(_formKeySignUp.currentState.validate() && terms == true){
                                    _formKeySignUp.currentState.save();
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(SignUpEvent(signUpModel));
                                  }else{
                                    autoValidateSignUp = AutovalidateMode.always;
                                  }
                                }
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}