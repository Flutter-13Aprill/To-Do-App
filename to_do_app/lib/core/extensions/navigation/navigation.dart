import 'package:flutter/material.dart';

extension Navigation on BuildContext{
    
    push(page){
    return Navigator.push(this, MaterialPageRoute(builder: (context)=>page));
    }
    replacement(page){
    return Navigator.pushReplacement(this, MaterialPageRoute(builder: (context)=>page));
    }
    }
