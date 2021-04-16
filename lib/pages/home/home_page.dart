import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Trang chủ",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 18, color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Local Api Endpoint: "),
                      Expanded(
                        child: Text(
                          Api.LOCAL_BASE_URL,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Remote Api Endpoint: "),
                      Expanded(
                        child: Text(
                          Api.REMOTE_BASE_URL,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('1. Vài cài đặt lưu device token'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      '2. Danh sách thông báo sẽ ở tab Thông báo, pull down để refresh'),
                  Text(
                      '3. Nếu thông báo có addtional data thì sẽ hiện ở snackbar bottom'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
