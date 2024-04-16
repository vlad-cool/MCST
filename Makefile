.PHONY: clean all

all: vector_sum lifo counter

counter: counter.v counter_test.v
	iverilog counter.v counter_test.v -o counter

vector_sum: vector_sum.v vector_sum_test.v counter.v
	iverilog vector_sum.v vector_sum_test.v -o vector_sum

lifo: lifo.v lifo_test.v counter.v
	iverilog lifo.v lifo_test.v -o lifo

clean:
	rm lifo vector_sum counter memory
