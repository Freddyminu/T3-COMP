#include<iostream>
#include<string>
#include<vector>
#include<iterator>
#include<fstream>
#define INT 0
#define FLOAT 1
#define STRING 2
#define VOID 3

using namespace std;
struct VALUE{
    int type;
    union{
        int intValue;
        float floatValue;
    };
    bool isResult;
};

struct sym{
    int type;
    union{
        int intVal;
        float floatVal;
        char* name;
    };
};
vector<string> output;
vector<string>::iterator itTmp;

void initFile();
void writeFile();

void mainInit();
void mainEnd();

void printInit();
void printEnd(int type);

void go_to(char to, int num);
void labelGen(char to, int num);

void load(string name);
void store(string name);
void compare(string cm,char label);
void literalLoad(char* c);
