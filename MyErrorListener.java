package br.ufscar.dc.compiladores.lalexico;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

public class MyErrorListener extends BaseErrorListener {
  @Override
  public void syntaxError( Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine,
                           String msg, RecognitionException e ) {
    // method arguments should be used for more detailed report
    throw new RuntimeException("Linha "+ line + ": "+ msg.substring(msg.length()-2,msg.length()-1) +" - simbolo nao identificado");
  }
}
