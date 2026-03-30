APP = fibonacci_app

all: $(APP)

$(APP): src/main.m src/FibonacciCalculator.m src/FibonacciCalculator.h
	clang -fobjc-arc -framework Foundation src/main.m src/FibonacciCalculator.m -o $(APP)

run: $(APP)
	./$(APP)

clean:
	rm -f $(APP)

.PHONY: all run clean
