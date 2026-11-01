// With -R+, every function from which the walk meets recursion is reported,
// with the chain of callers the walk took last. The chain does not always
// contain the recursion itself (Helper is reported, but only Walk calls
// itself); this is how the report has always worked.

Fact(n)
{
	if (n <= 1)
		return 1;
	return n * Fact(n - 1);
}

Pong(n)
{
	if (n > 0)
		return Ping(n - 1);
	return 0;
}

Ping(n)
{
	if (n > 0)
		return Pong(n - 1);
	return 0;
}

Helper()
{
	return 1;
}

Walk(n)
{
	if (n > 0)
		Walk(n - 1);
	return Helper();
}

// Outer calls Again before Again calls itself, so the walk from Base visits
// Again twice on one path.
Base()
{
	return 1;
}

Outer()
{
	return Again(0);
}

Again(n)
{
	if (n > 0)
		return Again(n - 1);
	return Base();
}

main()
{
	Fact(5);
	Ping(3);
	Walk(2);
	Outer();
}
