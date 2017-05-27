#include <stdio.h>

int main(int argc, char **argv, char **envp) {
	printf("argv: ");
	for (int i = 0; i < argc; i++) {
		printf("%s", argv[i]);
		if (i < argc - 1) {
			printf(", ");
		}
	};

	printf("envp: ");
	for (int i = 0; envp[i]; i++) {
		printf("%s\n", envp[i]);
	};

	return 0;
}
