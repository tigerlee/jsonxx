CXXFLAGS=-Werror -Wall -g

libjsonxx.a : jsonxx.o
	ar rs libjsonxx.a jsonxx.o

jsonxx_test: jsonxx_test.cc jsonxx.o

jsonxx.o: jsonxx.h jsonxx.cc
	g++ ${CXXFLAGS} -fPIC -c jsonxx.cc -o jsonxx.o

test: jsonxx_test
	./jsonxx_test

.PHONY: clean
clean:
	rm -f jsonxx_test libjsonxx.a *.o *~
