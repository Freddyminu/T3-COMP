all:
	bison lang.y -d -v
	flex lang.l
	g++ -g -o lang lang.tab.c lex.yy.c -lm
	./lang < texto-exemplo-2.txt
        
jasmin:
	java -jar jasmin-2.4/jasmin-2.4/jasmin.jar java_bytecode.j
	java java_class

clean:
	rm -f *.o *~ lex.yy.c lang.tab.c lang.tab.h java_bytecode.j java_class.class lang.out lang
