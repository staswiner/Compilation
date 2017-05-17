#pragma once
#include "Header.h"

int fCommand()
{
	return Match(esCommand, &index.Command, 5);
}