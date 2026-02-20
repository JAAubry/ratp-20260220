CXX = gcc

INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c 


all: $(OBJS)
	$(CXX)  $(INCS) -o testAll  $(OBJS) -lcmocka

	
exec : all
	testAll.exe
%.o: %.c
	$(CXX)  -c  $< -o $@ $(INCS)
	
clean:
	rm $(OBJS) 


mrproper: clean
	rm testAll
	rm result.xml
	rm -f *.gbda
	rm -f *.gcno