import 'dart:convert';
import 'package:api204/coin_desk_api/coin_desk_api_model/CoinDeskApiModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDeskApiUi extends StatefulWidget {
  const CoinDeskApiUi({super.key});

  @override
  State<CoinDeskApiUi> createState() => _CoinDeskApiUiState();
}

class _CoinDeskApiUiState extends State<CoinDeskApiUi> {
 Future<CoinDeskApiModel> coinDeskAPIFetchFun() async{
    String url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    http.Response response = await http.get(Uri.parse(url));
    var decodeData =await json.decode(response.body);
    CoinDeskApiModel coinDeskApiModel = CoinDeskApiModel.fromJson(decodeData);
    return coinDeskApiModel;
  }

  @override
  Widget build(BuildContext context) {
   coinDeskAPIFetchFun();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Desk API UI1'),
      ),
      body: FutureBuilder<CoinDeskApiModel>(
          future: coinDeskAPIFetchFun(),
          builder: (BuildContext context, AsyncSnapshot<CoinDeskApiModel> asyncSnapshot ){

            // This is trigger when occur error.
            if(asyncSnapshot.hasError){
              return Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Theme.of(context).primaryColor,
                body: Center(child: Text(asyncSnapshot.error.toString(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white,fontSize: 20,),)),
              );
            }

            // This is trigger when occur waiting stage.
            if(asyncSnapshot.connectionState == ConnectionState.waiting){
              return Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Theme.of(context).primaryColor,
                body:const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4,),),
              );
            }
            // At the end this is trigger.
            return  Column(
              children: [
                buildExpandedContainer(
                  context: context,
                  text: "Chart Name :  ${asyncSnapshot.data!.chartName}"
                ),
                buildExpandedContainer(
                    context: context,
                    text: "BPI EUR Rate :  ${asyncSnapshot.data!.bpi.eur.rate}"
                ),
                buildExpandedContainer(
                    context: context,
                    text: "BPI GBP Rate :  ${asyncSnapshot.data!.bpi.gbp.rate}"
                ),
                buildExpandedContainer(
                    context: context,
                    text: "BPI USD Rate :  ${asyncSnapshot.data!.bpi.usd.rate}"
                ),
                buildExpandedContainer(
                    context: context,
                    text: "Time :  ${asyncSnapshot.data!.time.updated}"
                ),
                buildExpandedContainer(
                    context: context,
                    text: "Disclaimer :  ${asyncSnapshot.data!.disclaimer}"
                ),
              ],
            );
          }
      )
    );
  }

  Expanded buildExpandedContainer({required BuildContext context, String? text} ) {
    return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text("$text",textAlign: TextAlign.center, softWrap: true,overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                );
  }
}
