.PHONY: clean all

all: vector_sum lifo

vector_sum: vector_sum.v vector_sum_test.v
	iverilog vector_sum.v vector_sum_test.v -o vector_sum

lifo: lifo.v
	iverilog lifo.v -o lifo

clean:
	rm lifo vector_sum
