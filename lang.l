%option noyywrap yylineno 
	// yylineno é uma opcao pra guardar o numero de \n do proprio FLEX!
	
	/* ========================================================================== */
	/* =========================== Sessão headers =============================== */
	/* ========================================================================== */
%{
#include <stdio.h>
#include <string.h>
#include "lang.tab.h"
int cont_col = 1;
int cont_line = 1;
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
"println"    	{ return T_Print;   }
"stdin"    	{ return T_ReadLine;   }

{ConstINT}      	{ yylval.ival = atof(yytext); return T_IntValue;		}
{ConstFLOAT}      	{ yylval.ival = atof(yytext); return T_FloatValue;		}
{IDENTIFICADOR} 	{ yylval.sval = strdup(yytext); return T_Identificador;	}
{STRING}			{ yylval.sval = strdup(yytext); return T_String;		}
{COMENTARIO}		{ yylval.sval = strdup(yytext); return T_Comment;		}

"{"[^}\n]*"}"     /* eat up one-line comments */
[ \t]+           /* eat up whitespace */
[[:space:]]|[[:space:]]+;  /* Linhas em branco não tem importancia! */
. printf("(Erro Léxico) Caracter não reconhecido %s\n", yytext ); //erros

%%
	/* ========================================================================== */
	/* ======================== Sessão Codigo Especifico ======================== */
	/* ========================================================================== */

