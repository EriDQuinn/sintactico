%{
	#include <stdio.h>
	#include <stdlib.h>
	extern int yylex(void);
	extern char *yytext;
	extern FILE *yyin;
	extern int linea;
	void yyerror(char *s);
%}


%token COMENT
%token ESPACIO
%token NUM
%token CARAC
%token CAD
%token ID
%token SWITCH
%token BREAK
%token PRINT
%token CASE
%token DEFAULT
%token FUNC
%token VOID 
%token CHAR
%token INT
%token FLOAT
%token DOUBLE
%token STRUCT
%token RETURN
%token IF 
%token ELSE
%token DO
%token FOR
%token WHILE
%token MAS
%token MUL
%token MENOS
%token ENTRE
%token MOD
%token PARA
%token PARC
%token ASIG
%token SEP
%token TERM
%token CORA
%token CORC
%token LLAVA
%token LLAVC
%token OR
%token AND
%token NOT
%token MAY
%token MEN
%token MAYI
%token MENI
%token IGU
%token DIFE
%token TRUE
%token FALSE
%token PUNTO

%start programa
%%
 /* P: DF;*/
 programa:{
 
 }
 /* D: TL ; | ε
3. T → H | struct { declaraciones }
4. H→ int | float | double | char | void
4. L → L , id
5. C → [ num ] C | ε
6. F → func T id(A ){ D } F | ε
7. A→ E | ε
8. E→ E, T id S| T id S
9. S→ [ ] S | ε

10. Z→ ZZ | if( W) X| if(W) Z else sX | while( W) X| do X while(W ); | for( X; W; X) X | K = G ; | return G; | return;| { X } | switch(G ){ B Y} | break; | print G;
11. B→ case: num X Y | ε
12. Y → default: X | ε
13. K → id | Q| id.id
14. Q→ id[ G] | Q[ G ]
15. G → G+ G | G - G| G* G | G/ G | G % G | Q | cad | num | carac | id( Ñ)
16. Ñ → ε | M
17. M→ M, G | G
18. W → W|| W | W&&W| ! W| (W) | R G| true | false
19. R → < | > | >= | <= | ! = | ==
*/






%%

void yyerror(char* s){
    printf("%s , en  la linea %d\n", s, yylval.line);
}




int main(int argc, char** argv){
    FILE* file;
    if(argc >1){
        file = fopen(argv[1], "r");
        if(file==NULL){
            printf("no existe el fichero %s\n", argv[1]);
            exit(1);
        }
        char nombre[50];
        strcpy(nombre, argv[1]);
        strcat(nombre, ".ci");
        yyout = fopen(nombre, "w");
        //printf("se abrio el archivo\n");
        yyin = file;        
        //yylval.sval = (char*) malloc(2*sizeof(char));
        yyparse();
        fclose(yyin);
        fclose(yyout);
    }
    
    return 1;
}

  
  
  
  
  
%%
