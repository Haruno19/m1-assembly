addexmp: addexmp.o
	ld -o addexmp addexmp.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

addexmp.o: addexmp.s
	as -arch arm64 -o addexmp.o addexmp.s