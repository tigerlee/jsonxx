CXXFLAGS=-Werror -Wall -g

jsonxx.so: jsonxx.o
	g++  ${CXXFLAGS} -Wl,-soname,libjsonxx.so --shared jsonxx.o -o libjsonxx.so

jsonxx_test: jsonxx_test.cc jsonxx.o

jsonxx.o: jsonxx.h jsonxx.cc
	g++ ${CXXFLAGS} -fPIC -c jsonxx.cc -o jsonxx.o

test: jsonxx_test
	./jsonxx_test

.PHONY: clean
clean:
	rm -f libjsonxx.so jsonxx_test *.o *~

