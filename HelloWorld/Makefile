AssembleAndRun: HelloWorld
	@echo
	./HelloWorld

HelloWorld : helloWorld.o
	ld helloWorld.o -o HelloWorld

helloWorld.o : helloWorld.asm
	nasm -felf64 helloWorld.asm

.PHONY: clean

clean:
	@rm -f helloWorld.o HelloWorld
