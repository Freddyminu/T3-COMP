#include<iostream>
#include<string>
#include<string.h>
#include<vector>
#include<iterator>
#include<fstream>

using namespace std;

struct token{
    string name;
    int type;
    int local;
    int constant;
};
vector<token>symbolTable;
vector<token>::iterator itSymTable;

void putSymbol(string symName, int type);
void insertSymbol(string nome, int type, int constant); // put symb coloca na tabela
token getSymbol(string nome);            // pega o nome do symb da tabela 
string getType(int type);           // pega o type do symb da tabela 
void showSymbolTable();                // mostra a tabela
bool areadyExists(string nome);         // verifica se ja exist
bool checkType(string nome,int type);   // verifica se ja existe o nome e o tipo igual