#include"utils.hpp"
#include<fstream>


char* removeQuotes(char* word){
    char* newWord = (char*)malloc(sizeof(word)-(2*sizeof(char)));
    int i;
    for(i=1;word[i]!='"';i++){
        newWord[i-1]=word[i];
    }
    newWord[i]='\0';
    std::cout << newWord << std::endl;

    return newWord;
}
