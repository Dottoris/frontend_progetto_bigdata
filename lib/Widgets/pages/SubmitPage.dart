import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/RecensioniDallaDataForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/REST/Query.dart';
class SubmitPage extends StatefulWidget{

  VisualizzationPage visualizzation;
  SubmitPage({required this.visualizzation});
  @override
  State<StatefulWidget> createState()=>_SubmitPageState();

}

class _SubmitPageState extends State<SubmitPage>{

   static Map<String,Form> visualMapping = {
    'negative reviews word count':Form.WORD_COUNT_NEGATIVE,
    'positive reviews word count': Form.WORD_COUNT_POSITIVE,
     'recensioni hotel':Form.RECENSIONI_HOTEL
  };

  String? dropdownvalue = visualMapping.keys.first;
  Form? _form = Form.WORD_COUNT_POSITIVE;
  Widget _formWidget = Container();
  @override
  Widget build(BuildContext context) {
    //TODO
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset("/images/submit.jpg"),
          ),
          buildForm()
        ],
      )
    );
  }

  Widget buildForm(){
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 50, top: 30),
            child: DecoratedBox(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red.shade50,
              ),
              child: Expanded(
                child: DropdownButton(
                  value: dropdownvalue,
                  items: visualMapping.keys.map((e) => DropdownMenuItem<String>(value: e,child: Text(e,textAlign: TextAlign.center))).toList(),
                  onChanged: (String? value)=>setState(()=>{
                    dropdownvalue=value,
                    _form = visualMapping[value],
                    setForm()
                  }),
                  dropdownColor: Colors.red.shade50,
                  underline: Container(height: 2,color: Colors.red.shade700,),
                ),
              )
            )
        ),
        _formWidget,

      ],
    );
  }

  List<DropdownMenuItem<String>> buildItems(){
      return visualMapping.keys.map((e) => DropdownMenuItem<String>(value: e,child: Text(e))).toList();
  }

  void setForm(){
    switch(_form){
      case Form.RECENSIONI_HOTEL: _formWidget = RecensioniDallaDataForm(visualizzation: widget.visualizzation);
    }
  }



}

enum Form{
  WORD_COUNT_NEGATIVE,
  WORD_COUNT_POSITIVE,
  RECENSIONI_HOTEL,
}