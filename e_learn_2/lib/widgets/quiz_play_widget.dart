import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {

  final String option, description, correctAns, optionSelected;

  OptionTile({this.option, this.description, this.correctAns, this.optionSelected});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: widget.description == widget.optionSelected ? widget.optionSelected == widget.correctAns ? Colors.green : Colors.red : Colors.grey)
            ),
            child: Text(widget.option, style: TextStyle(color: widget.optionSelected == widget.description ? widget.correctAns == widget.optionSelected ? Colors.green : Colors.red : Colors.grey),),
          ),
          SizedBox(width: 8,),
          Text(widget.description, style: TextStyle(fontSize: 17, color: Colors.black54),),
        ],
      ),
    );
  }
}
