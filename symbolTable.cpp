#include<iostream>
#include<vector>
#include<string.h>
#include<iterator>
#include "symbolTable.hpp"
#define INT 0
#define FLOAT 1
#define STRING 2
#define VAR 3
#define FUNC 4

using namespace std;

void insertSymbol(string symName, int type, int constant){  
    if( areadyExists(symName) ){
        token v = getSymbol(symName);
        if (v.constant == 1) {
            cout<<"A variavel \""<<symName<<"\" é uma constante e não pode ser mudada\n"<<endl;
            exit(1);
        }
        // colocar aqui: exclusão da variável anterior
    }
    
    symbolTable.push_back({symName,type,(int)symbolTable.size(),constant});

    cout << symName << " " << to_string((int)symbolTable.size()) << endl;
}

void putSymbol(string symName, int type){
    if( areadyExists(symName) ){
        token v = getSymbol(symName);
        if(v.constant == 1) {
            cout<<"A variavel \""<<symName<<"\" é uma constante e não pode ser mudada\n"<<endl;
            exit(1);
        }
    }
    symbolTable.push_back({symName,type,(int)symbolTable.size()});


    return;
}

token getSymbol(string symName){
    for(token v:symbolTable){
        if(v.name==symName)
            return v;
    }
    cout<<"A variavel \""<<symName<<"\" não existe\n"<<endl;
    exit(1);
}
void showSymbolTable(){
    cout<<endl<<"tabela de simbolos"<<endl;
    cout<<"=================="<<endl;
    for( token v:symbolTable ){
        cout<<"["<<v.name<<" | "<<getType(v.type)<<"] := "<<v.local<<endl;
    }
    cout<<endl<<"=================="<<endl;
}

string getType(int type){
    if(type == INT)
        return "int";
    else if(type == FLOAT)
        return "float";
    else if(type == STRING)
        return "string";
    else if(type == FUNC)
        return "function";
    return "";
}

bool areadyExists(string nome){
    for(token v:symbolTable){
        if(v.name==nome)
            return true;
    }
    return false;
}

bool checkType(string nome,int type){
    for(token v:symbolTable){
        if(v.name==nome)
            if(v.type==type)
                return true;
            else
                return false;
    }
    return false;
}

void clearSymTable(){
    symbolTable.clear();
}
