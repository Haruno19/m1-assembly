ASCIIconv: ASCIIconv.o
	ld -o ASCIIconv ASCIIconv.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

ASCIIconv.o: ASCIIconv.s
	as -arch arm64 -o ASCIIconv.o ASCIIconv.s