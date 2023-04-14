import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sending_and_getting_data_from_api/screens/add_data/provider/add_data_poovider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     Provider.of<AddScreenProvider>(context,listen: false).getApi();
  }
AddScreenProvider? T, F;
@override
  Widget build(BuildContext context) {
    T = Provider.of<AddScreenProvider>(context, listen: true);
    F = Provider.of<AddScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red.shade50,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Products",style: GoogleFonts.pacifico(color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: T!.jsonData!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                      width:20,
                      alignment:Alignment.center,
                      child: Text("${T!.jsonData![index].id}"),),
                  SizedBox(width: 20,),
                  Container(
                      width: 100,
                      alignment: Alignment.centerLeft,
                      child: Text("${T!.jsonData![index].productName}"),),
                  SizedBox(width: 20,),
                  Container(
                      width: 70,
                      alignment: Alignment.centerLeft,
                      child: Text("₹${T!.jsonData![index].productPrice}"),),
                  SizedBox(width: 20,),
                  Container(
                      width: 90,
                      child: Text("${T!.jsonData![index].productCategory}"),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black)
              ),
            );
          },
        ),
        // body: FutureBuilder(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return Text("${snapshot.error}");
        //     }
        //     else if (snapshot.hasData) {
        //       List<EcommerceModal>? ecommerceModal = snapshot.data;
        //       return ListView.builder(
        //         itemCount: ecommerceModal!.length,
        //         //itemCount: 5,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             margin: EdgeInsets.all(10),
        //             width: double.infinity,
        //             height: 70,
        //             child: Row(
        //               children: [
        //                 SizedBox(width: 20,),
        //                 Container(
        //                     width:20,
        //                     alignment: Alignment.center,
        //                     child: Text("${ecommerceModal[index].id}")),
        //                 SizedBox(width: 20,),
        //                 Container(
        //                     width: 100,
        //                     alignment: Alignment.centerLeft,
        //                     child: Text("${ecommerceModal[index].productName}")),
        //                 SizedBox(width: 20,),
        //                 Container(
        //                     width: 70,
        //                     alignment: Alignment.centerLeft,
        //                     child: Text("₹${ecommerceModal[index].productPrice}")),
        //                 SizedBox(width: 20,),
        //                 Container(
        //                     width: 90,
        //                     child: Text("${ecommerceModal[index].productCategory}")),
        //               ],
        //             ),
        //             decoration: BoxDecoration(
        //               color: Colors.red.shade100,
        //               borderRadius: BorderRadius.circular(50),
        //               border: Border.all(color: Colors.black)
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     return Center(child: CircularProgressIndicator());
        //   },
        //   future: F!.getApi(),
        // ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, 'add');
          },child: Icon(Icons.add,color: Colors.white),),
        ),
      ),
    );
  }
}
