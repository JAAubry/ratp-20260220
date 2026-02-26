CXX = gcc
LDFLAGS = -lgcov --coverage
INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c 

all: $(OBJS)
	$(CXX) $(LDFLAGS) $(INCS) -o testAll $(OBJS) -lcmocka

exec: all
	./testAll

%.o: %.c
	$(CXX) $(LDFLAGS) -c $< -o $@ $(INCS)

coverage: exec
	gcov -b ratp.c
	gcovr --html-details result.html 

clean:
	rm -f $(OBJS)

mrproper: clean
	rm -f testAll
	rm -f result.xml
	rm -f *.gcda
	rm -f *.gcno
	rm -f *.gcov