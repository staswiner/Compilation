#pragma once
#include "Header.h"

int fTask_List()
{
	return Match(esTask_List, &index.Task_List ,1);
}

int fTask_List_()
{
	return Match(esTask_List_, &index.Task_List_, 2);
}