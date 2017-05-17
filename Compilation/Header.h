#pragma once
#include <stdlib.h>
typedef struct {
	int type;
	int tokenType;
}Word;
Word* Create_Word(int type,int tokenType);
typedef struct {
	Word **words;
	int capacity;
	int count;
}Sentence;
typedef struct {
	char* a;
	int type;
	int line;
} Token;

typedef struct {
	Token **items;
	int capacity;
	int count;
} TokenVector;

enum eSentence{
	//es = enum sentence
	esCommand,
	esCommands,
	esCommands_,
	esCondition,
	esDeclaration,
	esDeclarations,
	esDeclarations_,
	esExpression,
	esParam_List,
	esParam_List_,
	esProgram,
	esTask_Definition,
	esTask_Definitions,
	esTask_Definitions_,
	esTask_List,
	esTask_List_,
	esEnd

};

enum eToken {
	ParBegin = 1,
	ParEnd = 2,
	Task = 3,
	Begin = 4,
	End = 5,
	Integer = 6,
	Real = 7,
	Do = 8,
	Until = 9,
	Od = 10,
	Send = 11,
	Accept = 12,
	arOp = 13,
	relOp = 14,
	add = 15,
	substract = 16,
	multiply = 17,
	devide = 18,
	lessthan = 19,
	morethan = 20,
	lessorequal = 21,
	moreorequal = 22,
	equal = 23,
	notequal = 24,
	ID = 25,
	Number = 26,
	Colon = 27,
	SemiColon = 28,
	OR = 29,
	assign = 30,
	dot = 31,
	OpenRBracket = 32,
	CloseRBracket = 33,
	OpenCBracket = 34,
	EndCBracket = 35,
	EmptyWord = 36,
	TokenEnd = 37
};

enum eWordType
{
	ewtVariable,
	ewtTerm
};

typedef struct {
	int Command;
	int Commands;
	int Commands_;
	int Condition;
	int Declaration;
	int Declarations;
	int Declarations_;
	int Expression;
	int Param_List;
	int Param_List_;
	int Program;
	int Task_Definition;
	int Task_Definitions;
	int Task_Definitions_;
	int Task_List;
	int Task_List_;
} sIndex;
typedef struct {
	int Command;
	int Commands;
	int Commands_;
	int Condition;
	int Declaration;
	int Declarations;
	int Declarations_;
	int Expression;
	int Param_List;
	int Param_List_;
	int Program;
	int Task_Definition;
	int Task_Definitions;
	int Task_Definitions_;
	int Task_List;
	int Task_List_;
} sOption;
sIndex index;
sOption option;
int line;
TokenVector Tokens;
char* TokenMap[TokenEnd];
Token* token;

Sentence* Sentences[esEnd];
Sentence CurrentSentence;
Word* CurrentWord;
int SentenceIndex;


void create_and_store_token(char* s, int type, int line);
void vector_init(TokenVector *);
int vector_total(TokenVector *);
void vector_resize(TokenVector *, int);
void vector_add(TokenVector *, Token *);
void vector_set(TokenVector *, int, Token *);
char *vector_get(TokenVector *, int);
void vector_delete(TokenVector *, int);
void vector_free(TokenVector *);

void Initialize_Sentences();
void vector_init2(Sentence *);
int vector_total2(Sentence *);
void vector_resize2(Sentence *, int);
void vector_add2(Sentence *, Word *);
void vector_set2(Sentence *, int, Word *);
char *vector_get2(Sentence *, int);
void vector_delete2(Sentence *, int);
void vector_free2(Sentence *);

int Match(int type, int* Index,int SentenceOptions);
int fCommand();
int fCommands();
int fCommands_();
int fCondition();
int fDeclaration();
int fDeclarations();
int fDeclarations_();
int fExpression();
int fParam_List();
int fParam_List_();
int fProgram();
int fTask_Definition();
int fTask_Definitions();
int fTask_Definitions_();
int fTask_List();
int fTask_List_();

int Get_Next_Expected_Token();
//{
	//switch (SentenceIndex)
	//{
	//case esCommand: fCommand(); break;
	//case esCommands: fCommands(); break;
	//case esCondition: fCondition(); break;
	//case esDeclaration: fDeclaration(); break;
	//case esDeclarations: fDeclarations(); break;
	//case esExpression: fExpression(); break;
	//case esParam_List: fParam_List(); break;
	//case esProgram: fProgram(); break;
	//case esTask_Definition: fTask_Definition(); break;
	//case esTask_Definitions: fTask_Definitions(); break;
	//default:break;
	//}
//}
//void next_token()
//{
//
//}