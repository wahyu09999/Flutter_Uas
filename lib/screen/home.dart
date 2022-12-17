import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_uas/model/category_models.dart';


import '../../network/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String token = '';
  String name = '';
  String email = '';
  List listCategory = [];

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      const key2 = 'email';
      final value = pref.get(key);
      final value1 = pref.get(key1);
      final value2 = pref.get(key2);
      token = '$value';
      name = '$value1';
      email = '$value2';
    });
  }

  getKategori() async {
    final response = await HttpHelper().getKategori();
    var dataResponse = json.decode(response.body);
    setState(() {
      var listRespon = dataResponse['data'];
      for (var i = 0; i < listRespon.length; i++) {
        listCategory.add(Category.fromJson(listRespon[i]));
      }
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
    getKategori();
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await HttpHelper().logout(token);
    setState(() {
      preferences.remove("token");
      preferences.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 25),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 29,
                        fontFamily: 'Raleway',
                        shadows: [
                          Shadow(
                            color: Colors.red.shade300,
                            blurRadius: 6,
                            offset: const Offset(4.0, 4.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome $name',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          shadows: [
                            Shadow(
                              color: Colors.red.shade300,
                              blurRadius: 6,
                              offset: const Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                              size: 29,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/',
                              );
                              logOut();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                child: ListView.builder(
                  itemCount: listCategory.length,
                  itemBuilder: (context, index) {
                    var kategori = listCategory[index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.greenAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.create_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              kategori.name,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
 ));
}
}