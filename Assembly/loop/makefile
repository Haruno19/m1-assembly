loop: loop.o
	ld -o loop loop.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

loop.o: loop.s
	as -arch arm64 -o loop.o loop.s