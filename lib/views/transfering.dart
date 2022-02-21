
import 'package:banking_app/model/Transfer.dart';
import 'package:banking_app/provider/TransferHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TransferingView extends StatefulWidget {
  const TransferingView({Key? key}) : super(key: key);

  @override
  _TransferingViewState createState() => _TransferingViewState();
}

class _TransferingViewState extends State<TransferingView> {


  @override
  void initState() {
    super.initState();
    Provider.of<TransferHelper>(context,listen: false).getTransfersFromDB();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<TransferHelper>(context,listen: false).getTransfersFromDB();
    Provider.of<TransferHelper>(context).Transfers;
    return Scaffold(
      backgroundColor: Color(0xff1F2630),
      appBar: AppBar(
        backgroundColor: Color(0xff152742F2),
        centerTitle: true,
        title: Text('Transfering Table'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Transfer>>(
        future: Provider.of<TransferHelper>(context).Transfers,
        builder: (BuildContext context,AsyncSnapshot<List<Transfer>> snapshot) {
          //print(_dB.retrieveUsers.toString());
          //print(snapshot.toString()+"gggggggggggggggggggggggggggg");
          if (snapshot.hasData) {
            return //Text('hhhhhhhhhhhhhhhhhh');
              ListView(children: <Widget>[

              DataTable(

                sortAscending: true,
                showCheckboxColumn: false,
                dividerThickness: 5,
                columnSpacing: 7,
                sortColumnIndex: 3,
                columns: [
                  DataColumn(
                      numeric: false,
                      label: Text(
                      "Client_1 ",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold)
                  )),
                  DataColumn(
                      numeric: false,
                      label: Center(child: Text(
                          "Client_2 ",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold)
                      ),)),
                  DataColumn(
                      numeric: false,
                      label: Text(
                      'Money',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)
                  )),
                  DataColumn(
                      numeric: false,
                      label: Center(child: Text(
                          'Time',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)
                      ),)),
                ],
                rows: List.generate(snapshot.data!.length, (index) => DataRow(
                    cells: [
                      DataCell(Text('${snapshot.data![index].user1}',style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                      DataCell(Text('${snapshot.data![index].user2}',style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                      DataCell(Text('${snapshot.data![index].money}',style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                      DataCell(Text('${snapshot.data![index].time}',style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                    ])),

              ),
            ]);

          } else{return Container(color: Colors.green,);}
        },
      ),
      ),
    );
  }
}
