import "package:flutter/material.dart";
import "package:unsad/controller/fetchMeme.dart";
import "package:unsad/controller/saveMyData.dart";

class MainScreen extends StatefulWidget {
   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  String imgurl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetInitMemeNo();

    UpdateImg();
  }

  void GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo! > 500) {
      targetMeme = 1000;
    } else if (memeNo! > 100) {
      targetMeme = 500;
    }
    setState(() {

    });
  }

    void UpdateImg() async {
      String getImgUrl = await Fetchmeme.fetchNewMeme();
      setState(() {
        imgurl = getImgUrl;
        isLoading = false;
      });
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Text(
                "Meme #${memeNo.toString()}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                  "Target ${targetMeme} memes", style: TextStyle(fontSize: 18)),
              SizedBox(height: 30),
              isLoading ?
              Container(
                  height: 400,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Center(
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator())
                  )
              )
                  :
              Image.network(
                imgurl,
                height: 400,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    memeNo = (memeNo ?? 0) + 1;

                    if (memeNo! > 500) {
                      targetMeme = 1000;
                    } else if (memeNo! > 100) {
                      targetMeme = 500;
                    }
                  });
                  await SaveMyData.saveData(memeNo!);
                  UpdateImg();
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text("More Fun!", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Spacer(),
              Text("APP CREATED BY", style: TextStyle(fontSize: 18)),
              Text(
                "MUHAMMAD SAQIB",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    }
  }

