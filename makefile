all:
	bison lang.y -d -v
	flex lang.l
	g++ -g -o lang lang.tab.c lex.yy.c -lm
	./lang < texto-exemplo-4.txt
        
jasmin:
	java -jar jasmin.jar -g output.j
	java output

clean:
	rm -f *.o *~ lex.yy.c lang.tab.c lang.tab.h java_bytecode.j java_class.class lang.out lang
