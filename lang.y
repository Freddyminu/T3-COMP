	/* ========================================================================== */
	/* =========================== Sessão headers =============================== */
	/* ========================================================================== */
%{
    #include <stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<math.h>

    #include "symtable.cpp"
    #include "jasminGen.cpp"

    #define INT 0
    #define FLOAT 1
    #define STRING 2
    #define FUNCTION 4

    extern FILE *yyin;
    extern FILE *yyout;
    extern int linha_num;    
    extern int yylex();
    extern int param_cont;
    extern int cont_line;
    extern int cont_col;
    void yyerror(const char* s);

    char label = 'A';

    int type = -1;

    int cont = 0;
%}

    /* Aqui temos os tipos de valores dos Tokens, no nosso caso temos valores inteiros, reais e caracteres (strings) */
%union{
    int ival;
    int fval;
    char* sval;

    struct VALUE{
        int type;
        union{
            int intValue;
            float floatValue;
        };
        bool isResult;
    } value;
}
%define parse.error verbose

	/* ========================================================================== */
	/* ============================= Sessão Tokens ============================== */
	/* ========================================================================== */

%token T_Let T_Import T_Func;
%token T_OpenParen T_CloseParen T_OpenCloseParen
%token T_OpenBracket T_CloseBracket 
%token T_Comma T_Quote T_DotComma T_doubleDot T_Dot
%token T_For T_If T_While T_Else T_Switch T_Case T_Default T_Do
%token T_OpenSquareBracket T_BackSlash T_CloseSquareBracket T_Equals 
%token T_UnderScore T_Percent T_ComercialAND T_Return T_Const;
%token T_EndLine;
%token T_Comment;
%token T_Not T_EqualsEQ T_NegativeEquals T_Or T_And T_SmallerThan T_SmallerThanEQ T_BiggerThan T_BiggerThanEQ
%token<ival> T_IntValue;
%token<fval> T_FloatValue;
%token<sval> T_String T_Biblioteca T_Identificador;

%type<ival> logical_expression;
%type<fval> expression type;

%left T_Minus T_Plus
%left T_Divide T_Times
%left T_Negative
%right T_Power

    /* ========================================================================== */
	/* ============================ Sessão Gramatica ============================ */
	/* ========================================================================== */

%start program
%%

program: {initFile(); mainInit();} lines {mainEnd();}
    ; 

lines: lines line
        | /* empty */; 

line:  T_EndLine
    | variable_declaration T_DotComma
    | attribution T_DotComma
    | function_usage T_DotComma
    | logical_structure
    | import T_DotComma
    | T_Comment
    ;

import: T_Import T_Identificador ;

variable_declaration: T_Let T_Identificador T_Equals variable {putSym($2, type, 0); store($2);}
        | T_Const T_Identificador T_Equals variable {putSym($2, type, 1); store($2);}
        ;

attribution: T_Identificador attribution_right {store($1);}
        ;

attribution_right:  T_Equals variable
        |  T_Plus T_Equals variable
        |  T_Minus T_Equals variable
        |  T_Divide T_Equals variable
        |  T_Times T_Equals variable
        |  T_Plus T_Plus
        |  T_Minus T_Minus
        ;        

function_usage: T_Identificador T_OpenParen optional_params T_CloseParen;

logical_structure: structure_for
    | structure_while
    | structure_do T_DotComma
    | structure_if structure_else
    | structure_switch
    ;

structure_for: T_For T_OpenSquareBracket T_Identificador T_doubleDot T_OpenParen type T_Comma type T_Comma type T_CloseParen T_CloseSquareBracket T_OpenBracket lines T_CloseBracket;

structure_if: T_If T_OpenSquareBracket logical_expression T_CloseSquareBracket T_OpenBracket lines T_CloseBracket;

structure_else: T_Else T_OpenBracket lines T_CloseBracket;
    | /* empty */;

structure_switch: T_Switch T_OpenSquareBracket T_Identificador T_CloseSquareBracket T_OpenBracket structure_cases structure_default T_CloseBracket;

structure_cases: structure_cases structure_case
    | /* empty */;

structure_case: T_Case T_OpenSquareBracket type T_CloseSquareBracket T_OpenBracket lines T_CloseBracket T_EndLine
    | line;
    ;

structure_default: T_Default T_OpenBracket lines T_CloseBracket T_EndLine;

structure_while: T_While T_OpenSquareBracket logical_expression T_CloseSquareBracket T_OpenBracket lines T_CloseBracket;

structure_do: T_Do T_OpenBracket lines T_CloseBracket T_While T_OpenSquareBracket logical_expression T_CloseSquareBracket;

logical_expression: expression T_EqualsEQ expression {$$ = $1 == $3; compar("eq",label);}
        | expression T_NegativeEquals expression {$$ = $1 != $3; compar("ne",label);}
        | expression T_BiggerThan expression {$$ = $1 > $3; compar("gt",label);}
        | expression T_SmallerThan expression {$$ = $1 < $3; compar("lt",label); }
        | expression T_BiggerThanEQ expression {$$ = $1 >= $3; compar("ge",label);}
        | expression T_SmallerThanEQ expression {$$ = $1 <= $3; compar("le",label);}
        | expression T_Or expression {$$ = $1 || $3; compar("or",label);}
        | expression T_And expression {$$ = $1 && $3; compar("and",label);}
        | T_Not expression {$$ = !$2;};

variable: T_String {type = STRING; string str=$1; output.push_back("\taload "+ str);}
    | expression
        // {printf(" Resultado: %d\n", $1);}
    | function_usage {type = FUNCTION;};

expression: type
    | expression T_Plus expression { $$ =$1 + $3; output.push_back("\tiadd");}
    | expression T_Minus expression { $$ = $1 - $3; output.push_back("\tisub");}
    | expression T_Times expression { $$ = $1 * $3; output.push_back("\timul");}
    | expression T_Divide expression { $$ = $1 / $3; output.push_back("\tidiv");}
    | T_Minus expression %prec T_Negative { $$ = -$2; output.push_back("\tineg");}
    | expression T_Power expression { $$ = pow($1, $3); output.push_back("\tipow");}
    | T_OpenParen expression T_CloseParen { $$ = $2; }
    ;

type: T_IntValue {$$ = $1; type=INT; output.push_back("\tldc "+to_string($1));}
    | T_FloatValue {$$ = $1; type=FLOAT; output.push_back("\tldc "+to_string($1));}
    | T_Identificador {
                // string str=$1;
                // load(str);
            }
    ;

optional_params: T_String
    | T_Identificador
    | /* empty */;

%%
	/* ========================================================================== */
	/* ======================== Sessão Codigo Especifico ======================== */
	/* ========================================================================== */

int main() {
    yyin = fopen("texto-exemplo.txt", "r");

    do{
        yyparse();
    } while(!feof(yyin));

    showSymTable();

    writeFile();

    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "\t\t%s\n", s);
    exit(1);
}