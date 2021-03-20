package br.ufscar.dc.compiladores.lalexico;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Token;

public class Principal {
    public static void main(String args[]) throws IOException{
        MyErrorListener errorListener = new MyErrorListener();
        
        //Definicao do arquivo de codigo de entrada
        CharStream cs = CharStreams.fromFileName(args[0]);
        LALexer lex = new LALexer(cs);
        lex.removeErrorListeners();
        lex.addErrorListener( errorListener );
        
        //Definicao do arquivo de escrita do resultado
        String path = args[1];
        System.out.println(path);
        File arquivo = new File(path);
        arquivo.getParentFile().mkdirs();
        if(arquivo.createNewFile()){
            System.out.println("arquivo foi criado");
        }else System.out.println("arquivo já exixtia");
        FileWriter arq = new FileWriter(arquivo, StandardCharsets.UTF_8);
        PrintWriter gravarArq = new PrintWriter(arq);
               
        Token t = null;
        
        try{
            while((t = lex.nextToken()).getType() != Token.EOF){
                System.out.println("indo");
                gravarArq.printf("<'"+t.getText().toString()+"',"+LALexer.VOCABULARY.getDisplayName(t.getType()).toString()+">%n");
            }
        }catch(RuntimeException e){
            System.out.println("deu erro");
            gravarArq.printf(e.getMessage()+"%n");
            arq.close();
        }
        
        arq.close();
    }
}

//CADMAISLINHA:
//    '"' ~('"')* '\n' {if(true) {System.out.print("erro na cadeia %n");throw new RuntimeException("cadeia mais de uma linha");}};
