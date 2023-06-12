// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/Drawers.dart';
import 'package:flutter_application_1/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/widgets/ItemBottom.dart';


class ItemPageShoeA extends StatelessWidget {
  const ItemPageShoeA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawers(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                "assets/image/image-shoe/mwc (1).jpg",
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 50,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Giày Thể Thao MWC - 5417",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: const Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text(
                                    "01",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: const Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Giày được thiết kế kiểu dáng buộc dây sneaker cực ngầu phối sọc thể thao năng động, phong cách hiện đại,màu sắc khỏe khoắn."
                          " Với chất vải Flyknit chuyên dụng tạo cảm giác thoải mái cho bạn trong suốt quá trình vận động, mang lại một phong cách thật thời thượng mỗi khi xuống phố. "
                          " Sản phẩm có thiết kế tinh tế cùng đường may tỉ mỉ, chắc chắn, thích hợp trong các hoạt động thể thao, dạo chơi, picnic",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ItemBottom(),
    );
  }
}
