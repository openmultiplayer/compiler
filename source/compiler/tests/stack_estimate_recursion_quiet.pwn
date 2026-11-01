// Without -R, recursion is not reported and the estimate is still printed
// as a number (the walk stops at the first caller that is already on the
// path).

Fact(n)
{
	new a[8];
	a[0] = n;
	if (n <= 1)
		return 1;
	return a[0] * Fact(n - 1);
}

Pong(n)
{
	new a[16];
	a[0] = n;
	if (n > 0)
		return Ping(a[0] - 1);
	return 0;
}

Ping(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return Pong(a[0] - 1);
	return Fact(n);
}

main()
{
	Ping(3);
}
