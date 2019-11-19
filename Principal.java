/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java_cup.Lexer;
import java_cup.parser;
import jflex.LexScan;

/**
 *
 * @author Charly Ponce
 */
public class Principal {
    
    //parser.parse();
    public static void main(String[] args) throws Exception {
        //E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Lexer.flex
        String ruta1 = "C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\Lexer.flex";
        //E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/LexerCup.flex
        String ruta2 = "C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\LexerCup.flex";
        //-parser", "Sintax", "E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.cup
        String[] rutaS = {"-parser", "Sintax", "C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\Sintax.cup"};
       generar(ruta1, ruta2, rutaS);
        
       /*String opciones[] = new String[5];
        opciones[0]="-destdir";
        opciones[1]="src"
                +File.separator+
                "codigo"; 
        opciones[2]="-parser"; //cambiar el nombre de la clase
        opciones[3]="Sintax"; 
        opciones[4]="src"
                +File.separator+
                "codigo" 
                +File.separator+
                "Sintax.cup"; //cambiar el nombre de la fuente
        try {     
            java_cup.Main.main(opciones);
            } 
        catch (Exception e) {
            System.out.print(e);
            }*/
                
    }

      public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        jflex.Main.generate(archivo);
        archivo = new File(ruta2);
        jflex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
//E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/sym.java
        Path rutaSym = Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                //E:/Documentos/NetBeansProjects/AnalizadorLexico/sym.java
                Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\sym.java"), 
                //E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/sym.java
                Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\sym.java")
        );
        
//E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.java
     /* Path rutaSin = Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        
        Files.move(
                //E:/Documentos/NetBeansProjects/AnalizadorLexico/Sintax.java
                Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\Sintax.java"), 
                //E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.java
                Paths.get("C:\\Users\\USUARIO\\Documents\\URL\\Compis\\AnalizadorLexico\\src\\codigo\\Sintax.java")
                
        );*/
     
    }
}
