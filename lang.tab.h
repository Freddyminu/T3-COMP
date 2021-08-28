/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_LANG_TAB_H_INCLUDED
# define YY_YY_LANG_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_Let = 258,
    T_Import = 259,
    T_Func = 260,
    T_Print = 261,
    T_ReadLine = 262,
    T_OpenParen = 263,
    T_CloseParen = 264,
    T_OpenCloseParen = 265,
    T_OpenBracket = 266,
    T_CloseBracket = 267,
    T_Comma = 268,
    T_Quote = 269,
    T_DotComma = 270,
    T_doubleDot = 271,
    T_Dot = 272,
    T_For = 273,
    T_If = 274,
    T_While = 275,
    T_Else = 276,
    T_Switch = 277,
    T_Case = 278,
    T_Default = 279,
    T_Do = 280,
    T_OpenSquareBracket = 281,
    T_BackSlash = 282,
    T_CloseSquareBracket = 283,
    T_Equals = 284,
    T_UnderScore = 285,
    T_Percent = 286,
    T_ComercialAND = 287,
    T_Return = 288,
    T_Const = 289,
    T_EndLine = 290,
    T_Comment = 291,
    T_Not = 292,
    T_EqualsEQ = 293,
    T_NegativeEquals = 294,
    T_Or = 295,
    T_And = 296,
    T_SmallerThan = 297,
    T_SmallerThanEQ = 298,
    T_BiggerThan = 299,
    T_BiggerThanEQ = 300,
    T_IntValue = 301,
    T_FloatValue = 302,
    T_String = 303,
    T_Biblioteca = 304,
    T_Identificador = 305,
    T_Minus = 306,
    T_Plus = 307,
    T_Divide = 308,
    T_Times = 309,
    T_Negative = 310,
    T_Power = 311
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 36 "lang.y"

    int ival;
    int fval;
    char* sval;
    char cval;

    struct VALUE{
        int type;
        union{
            int intValue;
            float floatValue;
        };
        bool isResult;
    } value;

#line 130 "lang.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LANG_TAB_H_INCLUDED  */
