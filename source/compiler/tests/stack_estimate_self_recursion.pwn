// Each function calls itself and is called by the next one, defined first so
// that it comes first in the caller list. The walk then puts each function on
// the path twice; the old compiler sized its path buffers for once and
// overflowed them (heap corruption).

C23(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return C23(n - 1) + C22(n - 1);
	return a[0];
}

C22(n)
{
	new a[3];
	a[0] = n;
	if (n > 0)
		return C22(n - 1) + C21(n - 1);
	return a[0];
}

C21(n)
{
	new a[2];
	a[0] = n;
	if (n > 0)
		return C21(n - 1) + C20(n - 1);
	return a[0];
}

C20(n)
{
	new a[1];
	a[0] = n;
	if (n > 0)
		return C20(n - 1) + C19(n - 1);
	return a[0];
}

C19(n)
{
	new a[5];
	a[0] = n;
	if (n > 0)
		return C19(n - 1) + C18(n - 1);
	return a[0];
}

C18(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return C18(n - 1) + C17(n - 1);
	return a[0];
}

C17(n)
{
	new a[3];
	a[0] = n;
	if (n > 0)
		return C17(n - 1) + C16(n - 1);
	return a[0];
}

C16(n)
{
	new a[2];
	a[0] = n;
	if (n > 0)
		return C16(n - 1) + C15(n - 1);
	return a[0];
}

C15(n)
{
	new a[1];
	a[0] = n;
	if (n > 0)
		return C15(n - 1) + C14(n - 1);
	return a[0];
}

C14(n)
{
	new a[5];
	a[0] = n;
	if (n > 0)
		return C14(n - 1) + C13(n - 1);
	return a[0];
}

C13(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return C13(n - 1) + C12(n - 1);
	return a[0];
}

C12(n)
{
	new a[3];
	a[0] = n;
	if (n > 0)
		return C12(n - 1) + C11(n - 1);
	return a[0];
}

C11(n)
{
	new a[2];
	a[0] = n;
	if (n > 0)
		return C11(n - 1) + C10(n - 1);
	return a[0];
}

C10(n)
{
	new a[1];
	a[0] = n;
	if (n > 0)
		return C10(n - 1) + C9(n - 1);
	return a[0];
}

C9(n)
{
	new a[5];
	a[0] = n;
	if (n > 0)
		return C9(n - 1) + C8(n - 1);
	return a[0];
}

C8(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return C8(n - 1) + C7(n - 1);
	return a[0];
}

C7(n)
{
	new a[3];
	a[0] = n;
	if (n > 0)
		return C7(n - 1) + C6(n - 1);
	return a[0];
}

C6(n)
{
	new a[2];
	a[0] = n;
	if (n > 0)
		return C6(n - 1) + C5(n - 1);
	return a[0];
}

C5(n)
{
	new a[1];
	a[0] = n;
	if (n > 0)
		return C5(n - 1) + C4(n - 1);
	return a[0];
}

C4(n)
{
	new a[5];
	a[0] = n;
	if (n > 0)
		return C4(n - 1) + C3(n - 1);
	return a[0];
}

C3(n)
{
	new a[4];
	a[0] = n;
	if (n > 0)
		return C3(n - 1) + C2(n - 1);
	return a[0];
}

C2(n)
{
	new a[3];
	a[0] = n;
	if (n > 0)
		return C2(n - 1) + C1(n - 1);
	return a[0];
}

C1(n)
{
	new a[2];
	a[0] = n;
	if (n > 0)
		return C1(n - 1) + C0(n - 1);
	return a[0];
}

C0(n)
{
	new a[1];
	a[0] = n;
	if (n > 0)
		return C0(n - 1) + 0;
	return a[0];
}

main()
{
	C23(3);
}
