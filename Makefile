.PHONY: clean all

all: vector_sum lifo counter

counter: counter.v counter_test.v
	iverilog counter.v counter_test.v -o counter

vector_sum: vector_sum.v vector_sum_test.v counter.v
	iverilog counter.v vector_sum.v vector_sum_test.v -o vector_sum

lifo: lifo.v counter.v
	iverilog counter.v lifo.v -o lifo

clean:
	rm lifo vector_sum
