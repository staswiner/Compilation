#pragma once
#include "Header.h"

int fCommands()
{
	return Match(esCommands, &index.Commands, 1);
}

int fCommands_()
{
	return Match(esCommands_, &index.Commands_ ,2);
}