enum Vector
{
	x,
	y,
	z
};

enum TestData
{
	position[Vector]
};

new data[TestData];

stock Sum(const values[Vector], size = sizeof(values))
{
	assert(size == _:Vector);
	return values[x] + values[y] + values[z];
}

main()
{
	data[position] = {1, 2, 3};
	return Sum(data[position]);
}
