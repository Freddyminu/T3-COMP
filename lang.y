	/* ========================================================================== */
	/* =========================== Sessão headers =============================== */
	/* ========================================================================== */
%{
    #include <stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<math.h>
    extern FILE *yyin;
    extern FILE *yyout;
    extern int linha_num;    
    extern int yylex();
    extern int param_cont;
    extern int cont_line;
    extern int cont_col;
    void yyerror(const char* s);

    int cont = 0;
%}

    /* Aqui temos os tipos de valores dos Tokens, no nosso caso temos valores inteiros, reais e caracteres (strings) */
%union{
    int ival;
    int fval;
    char* sval;
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

program: lines { printf("Program begins, Linha: %d Coluna: %d\n", cont_line, cont_col); }; 

lines: lines line
        | /* empty */; 

line:  T_EndLine { for(int i=0;i<cont;i++) printf("\t"); printf("Endline Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    | variable_declaration T_DotComma
    | attribution T_DotComma { for(int i=0;i<cont;i++) printf("\t");  printf("Attribution Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    | function_usage T_DotComma {   printf("Function Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    | logical_structure {   printf("Logical Structure Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    | import T_DotComma {   printf("Import Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    | T_Comment {   printf("Comment Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
    ;

import: T_Import T_Identificador ;

variable_declaration: T_Let T_Identificador T_Equals variable {printf("Variable declaration Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}
        | T_Const T_Identificador T_Equals variable { printf("Constant declaration Usage, Linha: %d Coluna: %d\n", cont_line, cont_col);}; 

attribution: T_Identificador attribution_right
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

logical_expression: expression T_EqualsEQ expression {$$ = $1 == $3;  }
        | expression T_NegativeEquals expression {$$ = $1 != $3; }
        | expression T_BiggerThan expression {$$ = $1 > $3; }
        | expression T_SmallerThan expression {$$ = $1 < $3; }
        | expression T_BiggerThanEQ expression {$$ = $1 >= $3; }
        | expression T_SmallerThanEQ expression {$$ = $1 <= $3; }
        | expression T_Or expression {$$ = $1 || $3; }
        | expression T_And expression {$$ = $1 && $3; }
        | T_Not expression {$$ = !$2;};

variable: T_String
    | expression {printf(" Resultado: %d\n", $1);}
    | function_usage;

expression: type
    | expression T_Plus expression { $$ =$1 + $3;}
    | expression T_Minus expression { $$ = $1 - $3; }
    | expression T_Times expression { $$ = $1 * $3; }
    | expression T_Divide expression { $$ = $1 / $3; }
    | T_Minus expression %prec T_Negative { $$ = -$2;}
    | expression T_Power expression { $$ = pow($1, $3);}
    | T_OpenParen expression T_CloseParen { $$ = $2; };

type: T_IntValue {$$ = $1;}
    | T_FloatValue {$$ = $1;}
    | T_Identificador {$$ = T_Identificador;}
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

    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "\t\t%s\n", s);
    exit(1);
}