import 'dart:io';

void clear(){
  print("\x1B[2J\x1B[0;0H");
}

void reload(){
  clear();
  print("         ~ Context 1.4 ~");
  print(" A not hackable small Editor. Xd\n");
  for (int i = 0; i < lines.length; i++){
    print((i + 1).toString() + " ~ " + lines[i].toString() + "\n");
  }
}

void check(String inp){
  if (helpLine == true){
    lines.removeLast();
    helpLine = false;
  }
  if (inp.isEmpty){
    lines.add("");
  }else{
    if (inp[0] == "#"){
      if (inp.split(" ")[0] == "#del"){
        if (lines.length != 0){
          lines.removeLast();
        }
      }else if (inp.split(" ")[0] == "#dell"){
        try{
          lines.removeAt(int.parse(inp.split(" ")[1]) - 1);
        }catch(e){
          lines.add("(Helpline) " + e.toString());
          helpLine = true;
        }
      }else if (inp.split(" ")[0] == "#dela"){
        while (lines.length > 0){
          lines.removeLast();
        }
      }else if (inp.split(" ")[0] == "#ins"){
        try{
          List listFinal = inp.split(" ");
          String textFinal = "";
          for (int i = 2; i < listFinal.length; i++){
            textFinal = textFinal + listFinal[i].toString() + " "; 
          }
          lines.insert(int.parse(inp.split(" ")[1]), textFinal);
        }catch(e){
          lines.add("(Helpline) " + e.toString());
          helpLine = true;
        }
      }else if (inp.split(" ")[0] == "#q"){
        exit(0);
      }else if (inp.split(" ")[0] == "#?"){
        lines.add("(Helpline) Commands: #del, #dela, #dell, #ins, #q, #?");
        helpLine = true;
      }else{
        lines.add("(Helpline) No command like this.");
        helpLine = true;
      }
    }else{
      lines.add(inp);
    }
  }
}

List lines = [];
bool helpLine = false;

void main(){
  String inp = "";
  clear();
  reload();

  while (true){
    inp = stdin.readLineSync().toString();
    check(inp);
    reload();
  }
}