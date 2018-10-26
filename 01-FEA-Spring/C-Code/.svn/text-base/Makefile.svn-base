CFLAGS         = -I.
LIBS      = -lstdc++ -lm -llapack -lblas -lgfortran 
ARMA_DIR  = /software/armadillo_OpenBlas-4.400.1/usr/local/include/
ARMALIB   = -I ${ARMA_DIR} -DARMA_DONT_USE_WRAPPER

CC		= g++

DEPS		= SpringFEA.h
OBJ 		= SpringFEA.o \
		ReadInput.o \
		PrintOutput.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) ${ARMALIB}

%.o: %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) ${ARMALIB}

SpringFEA: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS) ${ARMALIB}

.PHONY: clean

clean:
	rm -f *.o *~



