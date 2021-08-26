%option noyywrap yylineno 
%{
	#include "y.tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	int cont_col = 1;
	int cont_line = 1;
	int lineCounter = 1;

	extern int printLineNumber(int num);
%}
	/* ========================================================================== */
	/* =========================== Sessão Definições ============================ */
	/* ========================================================================== */

ConstINT [0-9]+
ConstFLOAT {ConstINT}.{ConstINT}
IDENTIFICADOR [a-zA-Z_][a-zA-Z0-9_]*
STRING \".*\"
COMENTARIO $$.*

%%
	/* ========================================================================== */
	/* =========================== Sessão REGRAS ================================ */
	/* ========================================================================== */
	
[ ]         { ++cont_col;    }
"\n"        { cont_line++; cont_col = 1; return T_EndLine; }
"let"       { return T_Let;        }
"import"    { return T_Import;        }
"func"      { return T_Func;        }
"("         { return T_OpenParen;    }
")"         { return T_CloseParen;     }
"{"         { return T_OpenBracket;    }
"}"         { return T_CloseBracket;    }
","         { return T_Comma;    }
\"        	{ return T_Quote;    }
";"         { return T_DotComma;    }
":"         { return T_doubleDot;    }
"."         { return T_Dot;    }
"["         { return T_OpenSquareBracket;    }
"\\"        { return T_BackSlash;    }
"]"         { return T_CloseSquareBracket;    }
"for"       { return T_For;    }
"if"        { return T_If;    }
"else"      { return T_Else;    }
"!"        	{ return T_Not;    }
"="         { return T_Equals;    }
"=="        { return T_EqualsEQ;    }
"!="        { return T_NegativeEquals;    }
"|"         { return T_Or;    }
"&"         { return T_And;    }
"<"         { return T_SmallerThan;    }
"<="        { return T_SmallerThanEQ;    }
">"         { return T_BiggerThan;    }
">="        { return T_BiggerThanEQ;  }
"_"         { return T_UnderScore;    }
"+"         { return T_Plus;    }
"while"     { return T_While; 	}
"do"      	{ return T_Do; 		}
"switch"    { return T_Switch; 	}
"case"      { return T_Case; 	}
"default"   { return T_Default; }
"do"      	{ return T_Do; 		}
"/"        	{ return T_Divide; 	}
"*"         { return T_Times;   }
"^"         { return T_Power;   }
"%"         { return T_Percent; }
"&"         { return T_ComercialAND;	}
"-"         { return T_Minus;   }
"return"    { return T_Return;  }
"const"    	{ return T_Const;   }
"int"    	{ return T_Int;   }
"float"    	{ return T_Float;   }
"bool"    	{ return T_Bool;   }
"String"    { return T_LongChar;   }

{ConstINT}      	{ yylval.ival = atof(yytext); return T_IntValue;		}
{ConstFLOAT}      	{ yylval.ival = atof(yytext); return T_FloatValue;		}
{IDENTIFICADOR} 	{ yylval.sval = strdup(yytext); return T_Identificador;	}
{STRING}			{ yylval.sval = strdup(yytext); return T_String;		}
{COMENTARIO}		{ yylval.sval = strdup(yytext); return T_Comment;		}

"{"[^}\n]*"}"     /* eat up one-line comments */
[ \t]+           /* eat up whitespace */
[[:space:]]|[[:space:]]+;  /* Linhas em branco não tem importancia! */
. printf("(Erro Léxico) Caracter não reconhecido %s\n", yytext ); //erros


	/* ========================================================================== */
	/* ======================== Sessão Codigo Especifico ======================== */
	/* ========================================================================== */ 
	 
%%

int yywrap() {
   // open next reference or source file and start scanning
   return -1;
}
