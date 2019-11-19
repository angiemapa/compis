package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* | "/*"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( "real"  ) {lexeme=yytext(); return T_dato;}

/* Tipo de dato Cadena */
( "cadena" ) {lexeme=yytext(); return Cadena;}

/*Tipo dato Nulo*/
( "nulo" ) {lexeme=yytext(); return Nulo;}

/*Entero Main*/
(entero) {lexeme=yytext(); return Entero;}

/*Tipo Booleano*/
(bolenao) {lexeme=yytext(); return Boleano;}

/* Palabra reservada Si */
(si) {lexeme=yytext(); return Si;}

/* Palabra reservada Entonces */
(entonces) {lexeme=yytext(); return Entonces;}

/* Palabra reservada Sino */
( "sino" ) {lexeme=yytext(); return Sino;}

/* Palabra reservada Hacer */
( "hacer" ) {lexeme=yytext(); return Hacer;}

/* Palabra reservada Mientras */
( "mientras" ) {lexeme=yytext(); return Mientras;}

/* Palabra reservada Para */
( "desde" ) {lexeme=yytext(); return Para;}

/* Palabra reservada Devolver */
( "devolver" ) {lexeme=yytext(); return Devolver;}

/* Palabra reservada Instanciar */
( "instanciar" ) {lexeme=yytext(); return Instanciar;}

/* Palabra reservada Leer */
( "leer" ) {lexeme=yytext(); return Leer;}

/* Palabra reservada Escribir */
( "escribir" ) {lexeme=yytext(); return Escribir;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operador Mod */
( "%" ) {lexeme=yytext(); return Mod;}

/*Operador Dos Puntos */
( ":" ) {lexeme=yytext(); return Dos_puntos;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=") {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" | "incrementar"| "decrementar" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(verdadero | falso)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( principal | Principal ) {lexeme=yytext(); return Principal;}

/* Marcador de inicio de algoritmo */
( constructor ) {lexeme=yytext(); return Constructor;}

/* Marcador inicio clase */
(clase) {lexeme=yytext(); return Clase;}

/* Marcador Metodo */
(Metodos | metodos | metodo | Metodo ) {lexeme=yytext(); return Metodo;}

/* Marcador de Propiedades */
( propiedad | propiedades ) {lexeme=yytext(); return Propiedad;}

/* Tipo de Dato por disponibilidad*/
( publicas | privadas | publicos | privados) {lexeme=yytext(); return T_Disponible;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Coma */
( "," ) {lexeme=yytext(); return Coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
