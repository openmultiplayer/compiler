/*  Implementation of a file functions interface for reading/writing into
 *  memory.
 *
 *  Copyright (c) faluco / http://www.amxmodx.org/, 2006
 *  Version: $Id: memfile.c 3636 2006-08-14 15:42:05Z thiadmer $
 */

#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "memfile.h"
#if defined FORTIFY
  #include <alloc/fortify.h>
#endif
#if defined _MSC_VER && defined _WIN32
  #define strdup _strdup
#endif

memfile_t *memfile_creat(const char *name, size_t init)
{
	memfile_t mf;
	memfile_t *pmf;

	mf.size = init;
	mf.base = (char *)malloc(init);
	mf.usedoffs = 0;
	if (!mf.base)
	{
		return NULL;
	}

	mf.offs = 0;

	pmf = (memfile_t *)malloc(sizeof(memfile_t));
	if (!pmf)
	{
		free(mf.base);
		return NULL;
	}
	memcpy(pmf, &mf, sizeof(memfile_t));

	pmf->name = strdup(name);

	return pmf;
}

void memfile_destroy(memfile_t *mf)
{
	assert(mf != NULL);
	free(mf->name);
	free(mf->base);
	free(mf);
}

void memfile_seek(memfile_t *mf, long seek)
{
	assert(mf != NULL);
	mf->offs = seek;
}

long memfile_tell(const memfile_t *mf)
{
	assert(mf != NULL);
	return mf->offs;
}

size_t memfile_read(memfile_t *mf, void *buffer, size_t maxsize)
{
	assert(mf != NULL);
	assert(buffer != NULL);
	if (!maxsize || mf->offs >= mf->usedoffs)
	{
		return 0;
	}

	if (mf->usedoffs - mf->offs < (long)maxsize)
	{
		maxsize = mf->usedoffs - mf->offs;
		if (!maxsize)
		{
			return 0;
		}
	}

	memcpy(buffer, mf->base + mf->offs, maxsize);

	mf->offs += maxsize;

	return maxsize;
}

int memfile_write(memfile_t *mf, const void *buffer, size_t size)
{
	assert(mf != NULL);
	assert(buffer != NULL);
	if (mf->offs + size > mf->size)
	{
		size_t newsize = (mf->size + size) * 2;
    char *newbase = (char *)realloc(mf->base, newsize);
		if (!newbase)
			return 0;
		mf->base = newbase;
		mf->size = newsize;
	}
	memcpy(mf->base + mf->offs, buffer, size);
	mf->offs += size;

	if (mf->offs > mf->usedoffs)
	{
		mf->usedoffs = mf->offs;
	}

	return 1;
}
