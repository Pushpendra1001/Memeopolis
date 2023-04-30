import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memeopolis/controler/fatch.dart';
import 'package:memeopolis/controler/savemydata.dart';

class mainScreen extends StatefulWidget {
  mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  String image_url = "";
  int? memeCount = 0;
  bool isLoading = true;
  int targetmeme = 50;
  bool sound_active = false;

  GetInitmemeNo() async {
    memeCount = await SaveMyData.fatchdata() ?? 0;
    if (memeCount! > 50) {
      targetmeme = 100;
    }
    if (memeCount! > 100) {
      targetmeme = 500;
      sound_active = true;
    }
    if (memeCount! > 500) {
      targetmeme = 1000;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitmemeNo();
    update_url();
  }

  void update_url() async {
    String update_link = await Fatchmeme.getFatch();

    setState(() {
      isLoading = false;
      image_url = update_link;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text("Memopolis")),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 65),
        Text(
          "Meme # ${memeCount.toString()}",
          style: TextStyle(color: Colors.black, fontSize: 39),
        ),
        SizedBox(height: 10),
        Text(
          "Target ${targetmeme} Memes",
          style: TextStyle(color: Colors.black, fontSize: 32),
        ),
        SizedBox(height: 30),
        isLoading
            ? Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator()),
                ),
              )
            : Image.network(
                height: 400,
                width: MediaQuery.of(context).size.width,
                image_url,
                fit: BoxFit.fitHeight),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              await SaveMyData.saveData(memeCount! + 1);
              GetInitmemeNo();
              update_url();
            },
            child: Container(
              height: 50,
              width: 90,
              child: const Center(
                  child: Text(
                "Ohh Yeh !!",
                style: TextStyle(fontSize: 20),
              )),
            )),
        Spacer(),
        Text(
          "App Created By",
          style: TextStyle(fontSize: 22),
        ),
        Text("Pushpendra Baswal"),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
