package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)*| "/*"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Tipos de datos */
( char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* cambiamos ingles a espaniol*/

/* Tipo de dato Entero */
("entero") {return new Symbol(sym.Entero, yychar, yyline, yytext());}

/* Tipo de dato Boolean */
("boleano") {return new Symbol(sym.Boleano, yychar, yyline, yytext());}

/* Tipo de dato String */
( "cadena" ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Tipo de dato Nulo*/
( "nulo" ) {return new Symbol(sym.Nulo, yychar, yyline, yytext());}

/* Palabra reservada If */
("si") {return new Symbol(sym.Si, yychar, yyline, yytext());}

/* Palabra reservada Entonces */
("entonces") {return new Symbol(sym.Entonces, yychar, yyline, yytext());}

/* Palabra reservada Else */
( "sino" ) {return new Symbol(sym.Sino, yychar, yyline, yytext());}

/* Palabra reservada Do */
( "hacer" ) {return new Symbol(sym.Hacer, yychar, yyline, yytext());}

/* Palabra reservada While */
( "mientras" ) {return new Symbol(sym.Mientras, yychar, yyline, yytext());}

/* Palabra reservada For */
( "desde" ) {return new Symbol(sym.Para, yychar, yyline, yytext());}

/* Palabra reservada Devolver */
( "devolver" ) {return new Symbol(sym.Para, yychar, yyline, yytext());}

/* Palabra reservada Devolver */
( "instanciar" ) {return new Symbol(sym.Instanciar, yychar, yyline, yytext());}

/* Palabra reservada Leer */
( "leer" ) {return new Symbol(sym.Leer, yychar, yyline, yytext());}

/* Palabra reservada Escribir */
( "escribir" ) {return new Symbol(sym.Escribir, yychar, yyline, yytext());}

/*aqui dejamos de cambiar los e to i*/

/* Punto */
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operador Mod */
( "%" ) {return new Symbol(sym.Mod, yychar, yyline, yytext());}

/* Operador 2 puntos */
( ":" ) {return new Symbol(sym.Dos_puntos, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" | "incrementar"| "decrementar"
) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( verdadero | falso ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "principal"|"Principal" ) {return new Symbol(sym.Principal, yychar, yyline, yytext());}

/* Marcador de Metodo */
( "metodo"|"Metodo"| "metodos" | "Metodos" ) {return new Symbol(sym.Metodo, yychar, yyline, yytext());}

/* Marcador de Constructor */
( "constructor" ) {return new Symbol(sym.Constructor, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "propiedad"|"propiedades" ) {return new Symbol(sym.Propiedad, yychar, yyline, yytext());}

/* Marcador de T_dato por disponibilidad */
( "publicas"|"privadas" | "publicos" | "privados") {return new Symbol(sym.T_Disponible, yychar, yyline, yytext());}

/* Marcador de clase */
( "clase" ) {return new Symbol(sym.Clase, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* coma */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
