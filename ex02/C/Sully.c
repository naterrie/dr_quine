#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int i = 5;
	char filename[50];
	char cmd[100];
	char *s = "#include <unistd.h>%1$c#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %4$d;%1$c%2$cchar filename[50];%1$c%2$cchar cmd[100];%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn (0);%1$c%2$ci--;%1$c%2$csprintf(filename, %3$cSully_%%d.c%3$c, i);%1$c%2$csprintf(cmd, %3$cgcc -Wall -Wextra -Werror %%s -o Sully_%%d%3$c, filename, i);%1$c%2$cint fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);%1$c%2$cif (fd == -1)%1$c%2$c%2$creturn (1);%1$c%2$cif (dprintf(fd, s, 10, 9, 34, i, s) < 0)%1$c%2$c{%1$c%2$c%2$cclose(fd);%1$c%2$c%2$creturn (1);%1$c%2$c}%1$c%2$cclose(fd);%1$c%2$cif (system(cmd) == -1)%1$c%2$c%2$creturn (1);%1$c%2$csprintf(cmd, %3$c./Sully_%%d%3$c, i);%1$c%2$creturn system(cmd);%1$c}%1$c";

	if (i <= 0)
		return (0);
	i--;
	sprintf(filename, "Sully_%d.c", i);
	sprintf(cmd, "gcc -Wall -Wextra -Werror %s -o Sully_%d", filename, i);
	int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fd == -1)
		return (1);
	if (dprintf(fd, s, 10, 9, 34, i, s) < 0)
	{
		close(fd);
		return (1);
	}
	close(fd);
	if (system(cmd) == -1)
		return (1);
	sprintf(cmd, "./Sully_%d", i);
	return system(cmd);
}
