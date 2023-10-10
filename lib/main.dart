import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _ischecked=false;
  bool _mode=false;
  String? drop="";
  List<String> clg=["AEC","ACET","ACOE"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Column(
              children:[
                SizedBox(height: 20),
                CheckboxMenuButton(value: _ischecked, onChanged:(val) {
                  setState(() {
                    _ischecked=val;
                  });
                },child: Text("Save the credentials"),
                  trailingIcon: Icon(Icons.save),
                ),
                SwitchListTile(value: _mode, onChanged:(val){
                  setState(() {
                    _mode=val;
                  });
                },
                  visualDensity: VisualDensity(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  title: Text("Allow Notifications"),
                ),
                DropdownMenu(
                  hintText: "select college",
                  dropdownMenuEntries:
                  clg.map<DropdownMenuEntry<String>>((e){
                    return DropdownMenuEntry(value:e,label:e);
                  }).toList(),
                  onSelected:(val){
                    setState(() {
                      drop=val;
                    });
                  },
                ),
                _ischecked==true && _mode && drop!.isNotEmpty?
                ElevatedButton(onPressed: (){
                  if(_ischecked==true)
                  {
                    print("verified");
                  }
                  else
                  {
                    print("not verified");
                  }
                }, child: Text("Check")
                ):Text(""),
              ],
            ),
            ),
        );
    }
}
