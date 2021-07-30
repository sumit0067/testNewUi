import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final key = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrViewController;
  bool flashlight=false;
  bool cameraFlip=false;
  @override
  void dispose() {
    super.dispose();
    _qrViewController?.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await _qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      await _qrViewController!.pauseCamera();
    }
      _qrViewController!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildQrView(context),
          Positioned(
            top: 40,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: ()async{
                     await _qrViewController?.toggleFlash();
                    },
                    icon: FutureBuilder<bool?>(
                      future: _qrViewController!.getFlashStatus(),
                      builder: (context, snapshot) {
                        if(snapshot.data!=null){
                          return Icon(
                              snapshot.data!?Icons.flash_on:Icons.flash_off,
                            color: Colors.white,
                            size: 30,
                          );
                        }else{
                          return Container();
                        }
                      },
                    ),
                ),
                IconButton(
                    onPressed: ()async{
                      await _qrViewController!.flipCamera();
                    },
                    icon: FutureBuilder(
                     future: _qrViewController?.getCameraInfo(),
                      builder: (context, snapshot) {
                       if(snapshot.data!=null){
                        return Icon(
                          Icons.flip_camera_ios_outlined,
                          color: Colors.white,
                          size: 30,
                        );
                      }else{
                         return Container();
                       }
                     }
                    )
                    // ):Icon(
                    //   Icons.flip_camera_android,
                    //   color: Colors.white,
                    //   size: 30,
                    // ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(context) => QRView(
        key: key,
        onQRViewCreated: onQRViewCreate,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width*0.8,
          borderLength: 40,
          borderWidth: 6,
          borderColor: Color(0xff9CA3AF)
        ),
      );

  void onQRViewCreate(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
  }
}
