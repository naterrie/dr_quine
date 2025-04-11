#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int	main(void)
{
	int	fd;
	char	*s;

	fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fd == -1)
		return (1);
	s = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$cint%2$cfd;%1$c%2$cchar%2$c*s;%1$c%1$c%2$cfd = open(%3$cGrace_kid.c%3$c, O_WRONLY | O_CREAT | O_TRUNC, 0644);%1$c%2$cif (fd == -1)%1$c%2$c%2$creturn (1);%1$c%2$cs = %3$c%5$s%3$c;%1$c%2$cif (dprintf(fd, s, 10, 9, 34, s) < 0)%1$c%2$c{%1$c%2$c%2$cclose(fd);%1$c%2$c%2$creturn (1);%1$c%2$c}%1$c%2$cclose(fd);%1$c%2$creturn (0);%1$c}%1$c// IM CODIIIIIIIIIIIIIIIIIIING (i guess)%1$c";
	if (dprintf(fd, s, 10, 9, 34, s) < 0)
	{
		close(fd);
		return (1);
	}
	close(fd);
	return (0);
}
// IM CODIIIIIIIIIIIIIIIIIIING (i guess)
