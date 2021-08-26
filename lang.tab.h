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
    T_OpenParen = 261,
    T_CloseParen = 262,
    T_OpenCloseParen = 263,
    T_OpenBracket = 264,
    T_CloseBracket = 265,
    T_Comma = 266,
    T_Quote = 267,
    T_DotComma = 268,
    T_doubleDot = 269,
    T_Dot = 270,
    T_For = 271,
    T_If = 272,
    T_While = 273,
    T_Else = 274,
    T_Switch = 275,
    T_Case = 276,
    T_Default = 277,
    T_Do = 278,
    T_OpenSquareBracket = 279,
    T_BackSlash = 280,
    T_CloseSquareBracket = 281,
    T_Equals = 282,
    T_UnderScore = 283,
    T_Percent = 284,
    T_ComercialAND = 285,
    T_Return = 286,
    T_Const = 287,
    T_EndLine = 288,
    T_Comment = 289,
    T_Not = 290,
    T_EqualsEQ = 291,
    T_NegativeEquals = 292,
    T_Or = 293,
    T_And = 294,
    T_SmallerThan = 295,
    T_SmallerThanEQ = 296,
    T_BiggerThan = 297,
    T_BiggerThanEQ = 298,
    T_IntValue = 299,
    T_FloatValue = 300,
    T_String = 301,
    T_Biblioteca = 302,
    T_Identificador = 303,
    T_Minus = 304,
    T_Plus = 305,
    T_Divide = 306,
    T_Times = 307,
    T_Negative = 308,
    T_Power = 309
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 35 "lang.y"

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

#line 127 "lang.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LANG_TAB_H_INCLUDED  */
