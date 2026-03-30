APP = array_app

all: $(APP)

$(APP): src/main.m src/ArrayManager.m src/ArrayManager.h
	clang -fobjc-arc -framework Foundation src/main.m src/ArrayManager.m -o $(APP)

run: $(APP)
	./$(APP)

clean:
	rm -f $(APP)

.PHONY: all run clean
