import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_test/Models/user_model.dart';
import 'package:food_test/blocs/app_bloc.dart';
import 'package:food_test/blocs/app_event.dart';
import 'package:food_test/blocs/app_states.dart';
import 'package:food_test/repos/repositories.dart';

import '../Widgets/CatigoriesWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      //
      body: RepositoryProvider(
        create: (context) => UserRepository(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top bar
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                              ),
                            ]),
                        child: Badge(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.all(6),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(CupertinoIcons.cart,
                                size: 30, color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //top title
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: const Column(
                    children: [
                      SizedBox(height: 34),
                      Text(
                        'Delicious\n Food For You',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Lato'),
                      )
                    ],
                  ),
                ),
                //search bar
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFEEEE),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      //Spacer(),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 250,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search", border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                //Product Widget
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocProvider(
                          create: (context) => UserBloc(
                                RepositoryProvider.of<UserRepository>(context),
                              )..add(LoadUserEvent()),
                          child: BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                            if (state is UserLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (state is UserLoadedState) {
                              List<UserModel> userLists = state.users;
                              // print(userLists[0].last_name);
                              return const Center(child: CategoriesWidget());
                            }

                            if (state is UserErrorState) {
                              String userLists = state.error;
                              // print("hello $userLists");
                              return CategoriesWidget();
                            }
                            return Container();
                          }

                              // child: CategoriesWidget()
                              ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
