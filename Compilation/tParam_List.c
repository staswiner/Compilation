#pragma once
#include "Header.h"

int fParam_List()
{
	return Match(esParam_List, &index.Param_List,1);
}

int fParam_List_()
{
	return Match(esParam_List_, &index.Param_List_, 2);
}
