/*
 * Copyright (C) 2014 Dhaby Xiloj <dhabyx@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package codigo;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase para almacenar el órden de los nodos
 * 
 * Creada para propósitos educativos, con el fin de entender cómo se guardaría
 * un nodo de información de un árbol sintáctico, pero sin optimizar el código 
 * para que el árbol consuma menos recursos.
 *
 * @author Dhaby Xiloj <dhabyx@gmail.com>
 */
public class Nodo {
    private int tipo;
    private int operador;
    private int valor;
    private final ArrayList<Nodo> hijos;

    public static final int TIPO_EXPRESION=100;
    public static final int TIPO_NUMERO=101;
    public static final int TIPO_OPERADOR=102;
    
    public static final int Sino = 8;
  public static final int Punto = 45;
  public static final int Parentesis_c = 23;
  public static final int Para = 11;
  public static final int Parentesis_a = 22;
  public static final int Suma = 13;
  public static final int Numero = 31;
  public static final int Corchete_c = 27;
  public static final int Constructor= 41;
  public static final int Op_booleano = 21;
  public static final int ERROR = 32;
  public static final int Entonces = 40;
  public static final int Corchete_a = 26;
  public static final int Identificador = 30;
  public static final int Comillas = 3;
  public static final int Entero = 5;
  public static final int Llave_c = 25;
  public static final int Llave_a = 24;
  public static final int Op_relacional = 18;
  public static final int P_coma = 29;
  public static final int T_dato = 4;
  public static final int Principal = 28;
  public static final int Cadena = 6;
  public static final int EOF = 0;
  public static final int Division = 16;
  public static final int Op_incremento = 20;
  public static final int Op_atribucion = 19;
  public static final int Resta = 14;
  public static final int Si = 7;
  public static final int Linea = 2;
  public static final int Leer = 43;
  public static final int Escribir = 44;
  public static final int error = 1;
  public static final int Op_logico = 17;
  public static final int Hacer = 9;
  public static final int Igual = 12;
  public static final int Mientras = 10;
  public static final int Mod = 39;
  public static final int Multiplicacion = 15;
  public static final int Nulo = 33;
  public static final int Clase = 34;
  public static final int Devolver = 35;
  public static final int T_Disponible = 36;
  public static final int Metodo = 37;
  public static final int Propiedad = 38;
  public static final int Instanciar = 42;
  public static final int Coma = 46;
  public static final int Dos_puntos = 48;
 public static final int Boleano = 47;
    /**
     *
     * @param tipo de nodo a crear
     * @param valor del nodo a crear
     */
    public Nodo(int tipo, int valor) {
        this.hijos = new ArrayList<>();  
        this.tipo = tipo;
        switch (this.tipo) {
            case Nodo.Op_relacional:
                break;
            case Nodo.Numero:
                this.valor = valor;
                break;
        }
    }
    
    public Nodo(int valor) {
        this.hijos = new ArrayList<>();
        this.tipo=Numero;
        this.valor=valor;
        this.operador=0;
    }
    
    public Nodo() {
        this.hijos = new ArrayList<>();
        this.tipo=0;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the operador
     */
    public int getOperador() {
        return operador;
    }

    public String getOperadorString() {
        if (operador == Suma)
            return "+";
        else if (operador == Resta)
            return "=";
        else if (operador == Multiplicacion)
            return "*";
        else if(operador == Division)
            return "/";
        else if(operador == Sino)
            return "sino";
        else if(operador == Punto)
            return "atribuir";
        else if(operador == Parentesis_c)
            return ")";
        else if(operador == Para)
            return "para";
        else if(operador == Parentesis_a)
            return ")";
        else if(operador == Corchete_c)
            return "[";
        else if(operador == Constructor)
            return "Constructor";
        else if(operador == Op_booleano)
            return "Boleano";
        else if(operador == Entonces)
            return "entonces";
        else if(operador == Corchete_a)
            return "]";
        else if(operador == Entero)
            return "var int";
        else if(operador == Llave_c)
            return "}";
        else if(operador == Llave_a)
            return "{";        
        else if(operador == Op_relacional)
            return "relacional";      
        
        else if(operador == Principal)
            return "principal";
        else if(operador == Cadena)
            return "cadena";
        else if(operador == Op_incremento)
            return "++";
        else if(operador == Op_atribucion)
            return "atribuyue";
        else if(operador == Si)
            return "si";
        else if(operador == Leer)
            return "leer";
        else if(operador == Escribir)
            return "escribir";
        else if(operador == Op_logico)
            return "logic";
        else if(operador == Hacer)
            return "hacer";
        else if(operador == Igual)
            return "igual";
        else if(operador == Mientras)
            return "mientras";
        else if(operador == Mod)
            return "%";
        else if(operador == Nulo)
            return "nulo";
        else if(operador == Clase)
            return "clase";
        else if(operador == Devolver)
            return "ret";
        else if(operador == T_Disponible)
            return "disponibilidad";
        else if(operador == Metodo)
            return "metodo";
        else if(operador == Propiedad)
            return "propiedad";
        else if(operador == Instanciar)
            return "inst";
        else if(operador == Coma)
            return ",";
        else if(operador == Dos_puntos)
            return ":";
        else if(operador == Boleano)
            return "boleano";
        return null;
    }
    
    /**
     * @param operador the operador to set
     */
    public void setOperador(int operador) {
        this.operador = operador;
    }

    /**
     * @return the valor
     */
    public int getValor() {
        return Numero;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(int valor) {
        this.valor = valor;
    }

    /**
     * @return the hijos
     */
    public List<Nodo> getHijos() {
        return hijos;
    }
    
    public boolean agregarHijo(Nodo nodo){
        return hijos.add(nodo);
    }
}
