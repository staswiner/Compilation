#pragma once
#include "Header.h"

int fDeclarations()
{
	return Match(esDeclarations, &index.Declarations,1);
}

int fDeclarations_()
{
	return Match(esDeclarations_, &index.Declarations_, 2);
}