import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.toNamed(Routes.ADD_BOOK),
        ),
        body: controller.obx((state) => ListView.separated(itemBuilder: (context,index){
          return ListTile(
            title: Text(state[index].user?.nama??"-"),
            subtitle: Text('Penulis ${state[index].book?.judul??"-"}'),
          );
        }, separatorBuilder: (context,index){
          return Divider();
        },
            itemCount: state!.length))
    );
  }
}
