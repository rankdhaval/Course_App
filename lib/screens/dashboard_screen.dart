import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:zignut_practicle/bloc/dashboard/dashboard_bloc.dart';
import 'package:zignut_practicle/model/dashhboard_request_parameter_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin{
  MotionTabController _tabController;
  DashboardParameterModel dashboardParameterModel=DashboardParameterModel(
      page: 1,
      perPage: 10
      );
  @override
  void initState() {
    super.initState();
    _tabController = new MotionTabController(initialIndex:1,vsync: this);
    BlocProvider.of<DashboardBloc>(context)
        .add(GetCourseDataEvent(dashboardParameterModel));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if(state is DashboardErrorState){
            Fluttertoast.showToast(
                msg: state.errorMessage,
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
          if(state is DashboardLoadingState){
            return Center(child: CircularProgressIndicator());
          } else if(state is DashboardLoadedState){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                          items: [
                            Image.asset('assets/ic_login_signup_hader.png'),
                            Image.asset('assets/ic_login_signup_hader.png'),
                            Image.asset('assets/ic_login_signup_hader.png')
                          ],
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 16/9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top:50.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.category, color: Colors.white,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.notifications_none_outlined, color: Colors.white,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.chat_bubble_outline_outlined, color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Courses', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),),
                            Text("see Whats's hot this Winter" , style: TextStyle( fontSize: 12, color: Colors.grey),),
                          ],
                        ),
                        Text('View All', style: TextStyle( fontSize: 14, color: Colors.black),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                      itemCount: state.dashboardResponseModel.data.featureCourse.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        print(state.dashboardResponseModel.toJson());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(state.dashboardResponseModel.data.featureCourse[index].courseBanner ?? 'https://element3-crm-test.s3.eu-central-1.amazonaws.com/courses/4%20H%20Privatunterricht_1366354245.png')
                              )
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical:  4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.dashboardResponseModel.data.featureCourse[index].name ?? 'Dummy Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
                                    Text(state.dashboardResponseModel.data.featureCourse[index].createdAt ?? '1/01/2020', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          } else{
            return Container();
          }
        },
      ),
      bottomNavigationBar: MotionTabBar(
      labels: [
      "Home","Book","Scan",'Profile',"Menu",
      ],
      initialSelectedTab: "Scan",
      tabIconColor: Colors.grey,
      tabSelectedColor: Colors.blue,
      onTabItemSelected: (int value){
        print(value);
        setState(() {
          _tabController.index = value;
        });
      },
      icons: [
        Icons.home,Icons.book,Icons.qr_code_scanner_rounded,Icons.person, Icons.menu
      ],
      textStyle: TextStyle(color: Colors.blue),
    ),
    );
  }
}
