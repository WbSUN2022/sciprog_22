FC = gfortran
FCFLAGS = -O0
LDFLAGS = -lm

all: matmultiple 

## the sequence of below matmul.o and main.o matters
matmultiple: matmul.o main.o
	$(FC) -o $@ $^ $(LDFLAGS)
##$(FC) -o matmultiple main.o matmul.o $(LDFLAGS)     

matmul.o: matmul.f90
	$(FC) -c $(FCFLAGS) $<
##$(FC) -c $(FCFLAGS) matmul.f90

main.o: main.f90
	$(FC) -c $(FCFLAGS) $<
##$(FC) -c $(FCFLAGS) main.f90

clean:
	rm *.o *.mod
