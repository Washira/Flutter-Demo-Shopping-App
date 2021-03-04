# การสร้าง UI ของแอพพลิเคชันร้านค้าออนไลน์

ลักษณะแอพพลิเคชันที่กำหนด เป็นแบบนี้

[Wireframe on Figma](https://www.figma.com/proto/bnt5T2cdKlBBimYAP9vzyE/ShoesShopDemo?node-id=1%3A2&scaling=min-zoom)

มีการกำหนด widget ของ UI แบ่งออกเป็นส่วนต่างๆ มีดังนี้

![UI Layout](/lib/assets/layout.png)

เมื่อมีแบบแล้ว ก็เริ่มต้นสร้างกันเลย

จาก prototype ด้านบน จะแสดงด้วย widget tree ของ layout เป็นแบบนี้

![Widget tree diagram](/lib/assets/shopping.png)

widget เสาหลักของแอพ ได้แก่

MaterialApp = widget ที่ห่อหุ้ม widget อื่นๆอยู่ กำหนดภาพรวมของแอพพลิเคชันเอาไว้ เช่น ชื่อแอพ หรือ ส่วน body แอพ

ในตัวอย่าง เราจะสร้างคลาส MyApp ที่เป็น StatelessWidget ให้คืนค่าออกมาเป็น MaterialApp เพื่อเอาไปใช้ห่อ่หุ้ม widget ต่างๆที่จะสร้างต่อจากนี้ให้แสดงผลออกมาเวลารันโค้ด

Scaffold = widget จัดการ layout อัติโนมัติของแอพพลิเคชั่น

การกำหนด widget Material นั้น เราจะสร้าง StatelessWidget class ขึ้นมา ชื่อว่า MyShoppingPage ละกัน โดยให้มันพ่น Material ออกมา จากนั้นให้ MaterialApp ที่ถูกคืนค่าออกมาจาก MyApp เรียกใช้งาน MyShoppingPage ให้เป็นส่วน body ของมัน

ดังนั้น จากส่วนบนสุดของ widget tree จะสามารถเขียน Source code เริ่มต้นได้ดังนี้

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyShoppingPage(),
      ),
    );
  }
}
```
