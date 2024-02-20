#include <stdarg.h>
#include <unistd.h>

#define HEX "0123456789abcdef"
#define DCM "0123456789"

void my_putchar(int c, size_t *size)
{
	write(STDOUT_FILENO, &c, sizeof(char));
	(*size)++;
}

void my_putstr(char *str, size_t *size)
{
	if (str == NULL)
	{
		my_putstr("(null)", size);
		return ;
	}
	for (int i = 0; str[i] != '\0'; i++)
		my_putchar(str[i], size);
}

void my_putnbr(int n, size_t *size)
{
	long long ll_n;

	ll_n = (long long)n;

	if (ll_n < 0)
	{
		my_putchar('-', size);
		ll_n = -ll_n;
	}

	if (ll_n < 10)
		my_putchar(DCM[ll_n], size);
	else
	{
		my_putnbr(ll_n / 10, size);
		my_putnbr(ll_n % 10, size);
	}

}

void my_puthex(unsigned int n, size_t *size)
{
	if (n < 16)
		my_putchar(HEX[n], size);
	else
	{
		my_puthex(n / 16, size);
		my_puthex(n % 16, size);
	}

}

void put_fmt(va_list *args, const char c, size_t *size)
{
	switch (c)
	{
		case 's':
			my_putstr(va_arg(*args, char *), size);
			break ;

		case 'd':
			my_putnbr(va_arg(*args, int), size);
			break ;

		case 'x':
			my_puthex(va_arg(*args, unsigned int), size);
			break ;
	}
}

int ft_printf(const char *fmt, ...)
{
	size_t size;
	va_list ap;

	va_start(ap, fmt);

	size = 0;
	for (int i = 0; fmt[i] != '\0'; i++)
	{
		if (fmt[i] == '%')
		{
			i++;
			put_fmt(&ap, fmt[i], &size);
		}
		else
			my_putchar(fmt[i], &size);
	}

	va_end(ap);

	return (size);
}

int main(void)
{
	size_t size = 4;
	my_putnbr(3, &size);
}
