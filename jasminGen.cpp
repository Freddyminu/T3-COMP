#include"jasminGen.hpp"
#include "utils.hpp"
#include<fstream>


void initFile(){
    output.push_back(".class public output");
    output.push_back(".super java/lang/Object");

    output.push_back(".method public <init>()V");
    output.push_back("\taload_0");

    output.push_back("\tinvokenonvirtual java/lang/Object/<init>()V");
    output.push_back("\treturn");
    output.push_back(".end method");
}

void mainInit(){
    output.push_back(".method public static main([Ljava/lang/String;)V");
    output.push_back("\t.limit stack 5");
    output.push_back("\t.limit locals 4");
    itTmp=output.end()-1;
}

void mainEnd(){
    output.push_back("return");
    output.push_back(".end method");
}

void printInit(){
	output.push_back("\tgetstatic java/lang/System/out Ljava/io/PrintStream;");
}

void printEnd(int type){
    if(type==STRING)
        output.push_back("\tinvokevirtual java/io/PrintStream/println(Ljava/lang/String;)V");
    else if(type==INT)
        output.push_back("\tinvokevirtual java/io/PrintStream/println(I)V");
    else if(type==FLOAT)
        output.push_back("\tinvokevirtual java/io/PrintStream/println(F)V");
}

void read(int type){
    string t;
	output.push_back("\tnew java/util/Scanner");
	output.push_back("\tdup");
	output.push_back("\tgetstatic java/lang/System/in Ljava/io/InputStream;");
	output.push_back("\tinvokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V");
    if(type==STRING){
	    output.push_back("\tinvokevirtual java/util/Scanner/nextLine()Ljava/lang/String;");
    }
    else if(type==INT){
	    output.push_back("\tinvokevirtual java/util/Scanner/nextInt()I");
    }
    else if(type==FLOAT){
	    output.push_back("\tinvokevirtual java/util/Scanner/nextFloat()F");
    }
}

void writeFile(){
    ofstream outFile ("output.j");
    for(string line:output){
        outFile << line << "\n";
    }
}

void store(string name){
    token v = getSymbol(name);
    if(v.type==STRING)
        output.push_back("\tastore "+to_string(v.local));
    else if(v.type==INT)
        output.push_back("\tistore "+to_string(v.local));
    else if(v.type==FLOAT)
        output.push_back("\tfstore "+to_string(v.local));
}

void load(string name){
    token v = getSymbol(name);
    cout << "Name: " << v.name << " Type: " << v.type << endl;
    if(v.type==STRING)
        output.push_back("\taload "+to_string(v.local));
    else if(v.type==INT)
        output.push_back("\tiload "+to_string(v.local));
    else if(v.type==FLOAT)
        output.push_back("\tfload "+to_string(v.local));
}

void go_to(char to, int num){
    string str = "\tgoto ";
    str+=to;
    str.append(to_string(num));
    output.push_back(str);
}

void labelGen(char to, int num){
    string str;
    str+=to;
    str.append(to_string(num));
    str.append(":");
    output.push_back(str);
}

void compare(string cm,char label){
    string str = "\tif_icmp";
    str.append(cm+" ");
    str+=label;
    str+="1";
    output.push_back(str);
}

void literalLoad(char* c){
    cout << "caiu aqui" << endl;
    char* formatedChar = removeQuotes(c);
    string str = "\tldc \"";
    str.append(formatedChar);
    str.append("\"");
    output.push_back(str);
}
