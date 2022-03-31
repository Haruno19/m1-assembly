beqexemp: beqexemp.o
	ld -o beqexemp beqexemp.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

beqexemp.o: beqexemp.s
	as -arch arm64 -o beqexemp.o beqexemp.s