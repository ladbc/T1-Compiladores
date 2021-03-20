lexer grammar LALexer;

options
{   
    language = Java;
}

PERCENT:
    '%';
NEGACAO:
    'nao';
E:
    'e';
OU: 
    'ou';
ALGORITMO:
    'algoritmo';
FINAL:
    'fim_algoritmo';
DECLARE:
    'declare';
CONSTANTE:
    'constante';
TIPO:
    'tipo';
LITERAL:
    'literal';
INTEIRO:
    'inteiro';
REAL:
    'real';
LOGICO:
    'logico';
LEIA:
    'leia';
ESCREVA:
    'escreva';
VERDADEIRO:
    'verdadeiro';
FALSO:
    'falso';
REGISTRO:
    'registro';
FIM_REGISTO:
    'fim_registro';
PROCEDIMENTO:
    'procedimento';
FIM_PROCEDIMENTO:
    'fim_procedimento';
FUNCAO:
    'funcao';
VAR:
    'var';
SE:
    'se';
ENTAO:
    'entao';
SENAO:
    'senao';
FIM_SE:
    'fim_se';
FIM_FUNCAO:
    'fim_funcao';
CASO:
    'caso';
SEJA:
    'seja';
FIM_CASO:
    'fim_caso';
PARA:
    'para';
ATE:
    'ate';
FACA:
    'faca';
FIM_PARA:
    'fim_para';
ENQUANTO:
    'enquanto';
FIM_ENQUANTO:
    'fim_enquanto';
RETORNE:
    'retorne';

ESTENDIDO:
    '^';

OP_UNARIO:
    '-';
SOMA:
    '+' ;
PONTO:
    '.';
VEZES:
    '*';
DIV:
    '/';
AND:
    '&';
IGUAL:
    '=';
MEM:
    '<>';
MEI:
    '>=';
MAI:
    '<=';
MAIOR:
    '>';
MENOR:
    '<';
DOISPONTOS:
    ':';
ABREPARENTESIS:
    '(';
FECHAPARENTESIS:
    ')';
VIRGULA:
    ',';
LEVA:
    '<-';
PONTOPONTO:
    '..';
ABREBAR:
    '[';
FECHABAR:
    ']';

CADEIA:
    '"' ~('"'|'\n'|'\r'|'\t')* '"';
CADMAISLINHA:
    '"' ~('"'|'\n'|'\r'|'\t')* {if(true) {throw new RuntimeException("Linha "+ getLine() +": cadeia literal nao fechada");}};

NUM_INT:
    (DIGITO)+;
NUM_REAL:
    (DIGITO)+ '.' (DIGITO)+;
IDENT:
    LETRA (LETRA | DIGITO)*;

LETRA:
    'a'..'z'|'A'..'Z'|'_';
DIGITO:
    '0'..'9';

Comentario:
    '{' ~('{'|'}'|'\n'|'\r'|'\t')* '}' {skip();};
COMAISLINHA:
    '{' ~('}'|'\n'|'\r'|'\t')* {if(true) {throw new RuntimeException("Linha "+ getLine() +": comentario nao fechado");}};

EB:
    (' '|'\t'|'\r'|'\n') {skip();};
