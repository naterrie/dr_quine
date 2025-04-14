#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define STR "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c#define STR %2$c%3$s%2$c%1$c#define MAIN(str) int main(void){ int fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_CREAT | O_TRUNC, 0644); if (fd == -1) return (1); if (dprintf(fd, str, 10, 34, str) < 0) { close(fd); return (1); } close(fd); return (0); }%1$c%1$cMAIN(STR)%1$c/*%1$c	IM CODIIIIIIIIIIIIIIIIIIING (i guess)%1$c*/%1$c"
#define MAIN(str) int main(void){ int fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644); if (fd == -1) return (1); if (dprintf(fd, str, 10, 34, str) < 0) { close(fd); return (1); } close(fd); return (0); }

MAIN(STR)
/*
	IM CODIIIIIIIIIIIIIIIIIIING (i guess)
*/
