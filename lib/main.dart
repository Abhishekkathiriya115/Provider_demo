import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/IteamProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Mangement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(value: ItemsProvider(),
      child: HomePage(),
      )

    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("Build Method");
    final iteamProvider = Provider.of<ItemsProvider>(context,listen: false );
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            RaisedButton(
              child: Text("Add Items"),
              onPressed: () {
                if(_textEditingController.text.isNotEmpty)
                  {
                    iteamProvider.addItems(_textEditingController.text);
                  }
              },
            ),
            Consumer<ItemsProvider>(
                builder: (_,data,__) =>
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.getItemData.length,
                        itemBuilder: (_,index) => ListTile(
                          onTap: (){
                            data.incrementCount(index);
                          },
                          title: Text('${data.getItemData[index]['title']}'),
                          trailing: CircleAvatar(
                            child: Text('${data.getItemData[index]['count']}'),
                          ),
                        ),
                      ),
                    )
            ),

          ],
        ),
      ),
    );
  }
}
