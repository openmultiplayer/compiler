// Stack estimate of a call graph without recursion: the longest chain of
// callers wins, and the shared callees (Leaf, Mid2) are reached along
// several paths.

Leaf()
{
	new a[10];
	a[0] = 1;
	return a[0];
}

Mid1()
{
	new a[20];
	a[0] = Leaf();
	return a[0];
}

Mid2()
{
	new a[5];
	a[0] = Leaf();
	return a[0];
}

Top()
{
	new a[30];
	a[0] = Mid1() + Mid2();
	return a[0];
}

forward Callback(x, y, z);
public Callback(x, y, z)
{
	return Mid2() + x + y + z;
}

main()
{
	Top();
	Mid2();
}
