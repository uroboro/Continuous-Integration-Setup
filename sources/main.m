#include <stdio.h>

#define PRINT(x, y) { \
	printf(#x " = { "); \
	for (int i = 0; x[i]; i++) { y(x[i], x[i+1] != NULL); } \
	printf("}\n"); \
	}

int main(int argc, char **argv, char **envp) {
	void (^myBlock)(char *, int) = ^(char *str, int i) {
		printf("%s%c ", str, i?',':0);
	};

	PRINT(argv, myBlock);
	PRINT(envp, myBlock);

	return 0;
}
