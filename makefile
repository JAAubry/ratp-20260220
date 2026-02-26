CXX = gcc
LDFLAGS = -lgcov --coverage
INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c 


all: $(OBJS)
	$(CXX) $(LDFLAGS) $(INCS) -o testAll  $(OBJS) -lcmocka
	gcov -b ratp.c

	
exec : all
	testAll.exe
%.o: %.c
	$(CXX) $(LDFLAGS) -c  $< -o $@ $(INCS)

coverage: exec
	gcov -b ratp.c
	
clean:
	rm $(OBJS) 


mrproper: clean
	rm testAll
	rm result.xml
	rm -f *.gbda
	rm -f *.gcno