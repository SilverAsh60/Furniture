import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/screens/home.dart';
import 'package:final_project_funiture_app/widgets/mybutton.dart';
import 'package:final_project_funiture_app/widgets/mytextformField.dart';
import 'package:final_project_funiture_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserSQ? userModel;
  TextEditingController? phoneNumber;
  TextEditingController? address;
  TextEditingController? userName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  bool isMale = false;
  void vaildation() async {
    if (userName!.text.isEmpty && phoneNumber!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name Is Empty "),
        ),
      );
    } else if (userName!.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (phoneNumber!.text.length < 11 || phoneNumber!.text.length > 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else {
      userDetailUpdate();
    }
  }

  File? _pickedImage;

  PickedFile? _image;
  final picker = ImagePicker();
  Future<void> getImage({required ImageSource source}) async {
    _image = await picker.getImage(source: source);
    if (_image != null) {
      setState(() {
        _pickedImage = File(_image!.path);
      });
    }
  }

  String? userUid;

  var imageMap;

  Future<String> _uploadImage({required File image}) async {
    String url;
    Reference storageReference =
    FirebaseStorage.instance.ref().child("UserImage/$userUid");
    //UploadTask uploadTask = storageReference.putFile(image);

    // uploadTask.whenComplete(() async {
    //   print('whenComplete');
    //   url = await storageReference.getDownloadURL();
    // }).catchError((onError) {
    //   print(onError);
    //   print('Error');
    // });

    url = await storageReference.getDownloadURL();

    return url;
  }

  void getUserUid() {
    User? myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser!.uid;
  }

  bool centerCircle = false;
  void userDetailUpdate() async {
    setState(() {
      centerCircle = true;
    });
    _pickedImage != null
        ? imageMap = await _uploadImage(image: _pickedImage!)
        : Container();
    FirebaseFirestore.instance.collection("User").doc(userUid).update({
      "UserName": userName!.text,
      "UserGender": isMale == true ? "Male" : "Female",
      "UserNumber": phoneNumber!.text,
      "UserImage": imageMap,
      "UserAddress": address!.text
    });
    setState(() {
      centerCircle = false;
    });
    setState(() {
      edit = false;
    });
  }

  Widget _buildSingleContainer(
      {required Color color,
        required String startText,
        required String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: edit == true ? color : Colors.white,
          borderRadius: edit == false
              ? BorderRadius.circular(30)
              : BorderRadius.circular(0),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: const TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? userImage;
  bool edit = false;
  Widget _buildContainerPart() {
    address = TextEditingController(text: userModel?.address);
    userName = TextEditingController(text: userModel?.fullName);
    phoneNumber = TextEditingController(text: userModel?.phone);
    if (userModel?.gender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSingleContainer(
            color: Colors.white,
            endText: userModel!.fullName,
            startText: "Name",
          ),
          _buildSingleContainer(
            color: Colors.white,
            endText: userModel!.email,
            startText: "Email",
          ),
          _buildSingleContainer(
            color: Colors.white,
            endText: userModel!.gender,
            startText: "Gender",
          ),
          _buildSingleContainer(
            color: Colors.white,
            endText: userModel!.phone,
            startText: "Phone Number",
          ),
          _buildSingleContainer(
            color: Colors.white,
            endText: userModel!.address,
            startText: "Address",
          ),
        ],
      ),
    );
  }

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Pick Form Camera"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Pick Form Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormFliedPart() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: "UserName",
            controller: userName!,
          ),
          _buildSingleContainer(
            color: Colors.grey,
            endText: userModel!.email,
            startText: "Email",
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: _buildSingleContainer(
              color: Colors.white,
              endText: isMale == true ? "Male" : "Female",
              startText: "Gender",
            ),
          ),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber!,
          ),
          MyTextFormField(
            name: "Address",
            controller: address!,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getUserUid();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff2f9fe),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.redAccent,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              edit = false;
            });
          },
        )
            : IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            });
          },
        ),
        backgroundColor: Colors.white,
        actions: [
          edit == false
              ? Container()
              : IconButton(
            icon: const Icon(
              Icons.check,
              size: 30,
              color: Color(0xff746bc9),
            ),
            onPressed: () {
              vaildation();
            },
          ),
        ],
      ),
      body: centerCircle == false
          ? ListView(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var myDoc = snapshot.data!.docs;
                for (var checkDocs in myDoc) {
                  if (checkDocs.data()["UserId"] == userUid) {
                    userModel = UserSQ(
                      idUser: checkDocs.reference.id,
                      email: checkDocs.data()["UserEmail"],
                      img: checkDocs.data()["UserImage"],
                      address: checkDocs.data()["UserAddress"],
                      gender: checkDocs.data()["UserGender"],
                      fullName: checkDocs.data()["UserName"],
                      phone: checkDocs.data()["UserNumber"],
                      dateEnter: checkDocs.data()['dateEnter'],
                      status: checkDocs.data()['status'],
                      birthDate: checkDocs.data()['birthDate'],
                    );
                  }
                }
                return Container(
                  height: 603,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    maxRadius: 65,
                                    backgroundImage: _pickedImage == null
                                        ? userModel!.img.isEmpty
                                        ? const AssetImage(
                                        "assets/images/userImage.png")
                                    as ImageProvider
                                        : NetworkImage(
                                        userModel!.img)
                                        : FileImage(_pickedImage!)),
                              ],
                            ),
                          ),
                          edit == true
                              ? Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context)
                                    .viewPadding
                                    .left +
                                    220,
                                top: MediaQuery.of(context)
                                    .viewPadding
                                    .left +
                                    110),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  myDialogBox(context);
                                },
                                child: const CircleAvatar(
                                  backgroundColor:
                                  Colors.transparent,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color(0xff746bc9),
                                  ),
                                ),
                              ),
                            ),
                          )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: edit == true
                                    ? _buildTextFormFliedPart()
                                    : _buildContainerPart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: edit == false
                              ? MyButton(
                            name: "Edit Profile",
                            onPressed: () {
                              setState(() {
                                edit = true;
                              });
                            },
                          )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: getFooter(5, context),
    );
  }
}
