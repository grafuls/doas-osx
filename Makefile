doas : parse.o doas.o
		cc -o doas parse.o doas.o
		
y.tab.c : parse.y
		yacc -d parse.y
	
parse.c : y.tab.c
		mv y.tab.c parse.c

parse.o : parse.c
		cc -O2 -pipe -I/. -Wall -c parse.c
		
doas.o : doas.c
		cc -O2 -pipe -I/. -Wall -c doas.c

clean :
	rm -f y.tab.* doas *.o parse.c