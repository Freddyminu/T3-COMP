#include<iostream>
#include<vector>
#include<string.h>
#include<iterator>
#define INT 0
#define FLOAT 1
#define STRING 2
#define VAR 3
#define FUNC 4

using namespace std;

struct var{
    string name;
    int type;
    int local;
};
vector<var>symtable;

void putSym(string nome, int type); // put symb coloca na tabela
var getSym(string nome);            // pega o nome do symb da tabela 
string getType(int type);           // pega o type do symb da tabela 
void showSymTable();                // mostra a tabela
bool areadyExists(string nome);         // verifica se ja exist
bool checkType(string nome,int type);   // verifica se ja existe o nome e o tipo igual

void putSym(string symName, int type){  
    if( areadyExists(symName) ){
        cout<<"A variavel \""<<symName<<"\" ja existe\n"<<endl;
        exit(1);
    }
    symtable.push_back({symName,type,(int)symtable.size()});


    return;
}

var getSym(string symName){
    for(var v:symtable){
        if(v.name==symName)
            return v;
    }
    cout<<"A variavel \""<<symName<<"\" não existe\n"<<endl;
    exit(1);
}
void showSymTable(){
    cout<<endl<<"tabela de simbolos"<<endl;
    cout<<"=================="<<endl;
    for( var v:symtable ){
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
    return "";
}


bool areadyExists(string nome){
    for(var v:symtable){
        if(v.name==nome)
            return true;
    }
    return false;
}

bool checkType(string nome,int type){
    for(var v:symtable){
        if(v.name==nome)
            if(v.type==type)
                return true;
            else
                return false;
    }
    return false;
}

void cleanSymTable(){
    symtable.clear();
}
