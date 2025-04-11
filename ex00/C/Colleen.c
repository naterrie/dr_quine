#include <stdio.h>

void	print(char *s)
{
	printf(s, 10, 9, 34, s);
}

int	main(void)
{
	// Comment 1
	char *s;
	s = "#include <stdio.h>%1$c%1$cvoid%2$cprint(char *s)%1$c{%1$c%2$cprintf(s, 10, 9, 34, s);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$c// Comment 1%1$c%2$cchar *s;%1$c%2$cs = %3$c%4$s%3$c;%1$c%2$cprint(s);%1$c%2$creturn (0);%1$c}%1$c// Comment 2%1$c";
	print(s);
	return (0);
}
// Comment 2
