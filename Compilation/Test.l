%{
#define TEST_IN_FILE1 "C:\\temp\\test1.txt"
#define TEST_IN_FILE2 "C:\\temp\\test2.txt"
#define TEST_OUT_FILE1 "C:\\temp\\test1_321354177_311201974_lex.txt"
#define TEST_OUT_FILE2 "C:\\temp\\test2_321354177_311201974_lex.txt"
#include <stdio.h>
#include <stdlib.h>
#define VECTOR_INIT_CAPACITY 4

#define VECTOR_INIT(vec) vector vec; vector_init(&vec)
#define VECTOR_ADD(vec, item) vector_add(&vec, (void *) item)
#define VECTOR_SET(vec, id, item) vector_set(&vec, id, (void *) item)
#define VECTOR_GET(vec, type, id) (type) vector_get(&vec, id)
#define VECTOR_DELETE(vec, id) vector_delete(&vec, id)
#define VECTOR_TOTAL(vec) vector_total(&vec)
#define VECTOR_FREE(vec) vector_free(&vec)
int line = 1;
 FILE* testOut;



enum Token {
ParBegin,
ParEnd,
Task,
Begin,
End,
Integer,
Real,
Do,
Until,
Od,
Send,
Accept,
arOp,
relOp,
add,
substract,
multiply,
devide,
lessthan,
morethan,
lessorequal,
moreorequal,
equal,
notequal,
ID,
Number,
Colon,
SemiColon,
OR,
assign,
dot,
OpenRBracket,
CloseRBracket,
OpenCBracket,
EndCBracket,
}; 

%}

LETTER [a-z]*
INTEGER [1-9][0-9]*
REAL [0-9]*[.][0-9]+|[0-9]*
ID [a-z][a-z0-9]*
SPACES [ ]*
TABS [\t]*

/* reserved words */
parend "parend"		
task	"task"	
parbegin "parbegin"	
begin	"begin"	
end	"end"	
integer	"integer"	
real	"real"	
do	"do"	
until	"until"	
od	"od"	
send	"send"	
accept	"accept"	

%%
parend							{fprintf(testOut,"Token from type 'parend'			was found at line: %d, lexeme: '%s'\n",line,yytext);return ParEnd;}
task							{fprintf(testOut,"Token from type 'task'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Task;} 
parbegin						{fprintf(testOut,"Token from type 'parbegin'		was found at line: %d, lexeme: '%s'\n",line,yytext);return ParBegin;}
begin							{fprintf(testOut,"Token from type 'begin'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Begin;}   
end								{fprintf(testOut,"Token from type 'end'				was found at line: %d, lexeme: '%s'\n",line,yytext);return End;} 
integer							{fprintf(testOut,"Token from type 'integer'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Integer;}   
real							{fprintf(testOut,"Token from type 'real'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Real;} 
do								{fprintf(testOut,"Token from type 'do'				was found at line: %d, lexeme: '%s'\n",line,yytext);return Do;}   
until							{fprintf(testOut,"Token from type 'until'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Until;} 
od								{fprintf(testOut,"Token from type 'od'				was found at line: %d, lexeme: '%s'\n",line,yytext);return Od;}   
send							{fprintf(testOut,"Token from type 'send'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Send;} 
accept							{fprintf(testOut,"Token from type 'accept'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Accept;}   
"*"|"/"|"+"|"-"					{fprintf(testOut,"Token from type 'ar-op'			was found at line: %d, lexeme: '%s'\n",line,yytext);return arOp;} 
"=="|"!="|">"|"<"|"<="|">="		{fprintf(testOut,"Token from type 'rel-op'			was found at line: %d, lexeme: '%s'\n",line,yytext);return relOp;}   
"="								{fprintf(testOut,"Token from type 'assign'			was found at line: %d, lexeme: '%s'\n",line,yytext);return assign;}   
"||"							{fprintf(testOut,"Token from type 'or'				was found at line: %d, lexeme: '%s'\n",line,yytext);return OR;}   
{ID}							{fprintf(testOut,"Token from type 'ID'				was found at line: %d, lexeme: '%s'\n",line,yytext);return ID;} 
{REAL}|{INTEGER}				{fprintf(testOut,"Token from type 'Number'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Number;}   
","								{fprintf(testOut,"Token from type 'Colon'			was found at line: %d, lexeme: '%s'\n",line,yytext);return Colon;} 
"."								{fprintf(testOut,"Token from type 'dot'				was found at line: %d, lexeme: '%s'\n",line,yytext);return dot;} 
";"								{fprintf(testOut,"Token from type 'semiColon'		was found at line: %d, lexeme: '%s'\n",line,yytext);return SemiColon;}   
"("								{fprintf(testOut,"Token from type 'OpenRBracket'	was found at line: %d, lexeme: '%s'\n",line,yytext);return OpenRBracket;} 
")"								{fprintf(testOut,"Token from type 'CloseRBracket'	was found at line: %d, lexeme: '%s'\n",line,yytext);return CloseRBracket;}   
"{"								{fprintf(testOut,"Token from type 'OpenCBracket'	was found at line: %d, lexeme: '%s'\n",line,yytext);return OpenCBracket;} 
"}"								{fprintf(testOut,"Token from type 'EndCBracket'		was found at line: %d, lexeme: '%s'\n",line,yytext);return EndCBracket;}   
"\n"							{line++;}
" "								{}
"\t"							{}
.        {fprintf(testOut,"The character '%s' at line: %d does not begin any legal token in the language.\n",yytext, line);return 50;}
%%
typedef struct ToKen {
	char* a;
	int type;
	int line;
} ToKen;

typedef struct vector {
    ToKen **items;
    int capacity;
    int total;
} vector;

void vector_init(vector *);
int vector_total(vector *);
static void vector_resize(vector *, int);
void vector_add(vector *, char *);
void vector_set(vector *, int, char *);
char *vector_get(vector *, int);
void vector_delete(vector *, int);
void vector_free(vector *);

void vector_init(vector *v)
{
    v->capacity = VECTOR_INIT_CAPACITY;
    v->total = 0;
    v->items = malloc(sizeof(ToKen *) * v->capacity);
}

int vector_total(vector *v)
{
    return v->total;
}

static void vector_resize(vector *v, int capacity)
{
    #ifdef DEBUG_ON
    printf("vector_resize: %d to %d\n", v->capacity, capacity);
    #endif

    void **items = realloc(v->items, sizeof(ToKen *) * capacity);
    if (items) {
        v->items = items;
        v->capacity = capacity;
    }
}

void vector_add(vector *v, ToKen *item)
{
    if (v->capacity == v->total)
        vector_resize(v, v->capacity * 2);
    v->items[v->total++] = item;
}

void vector_set(vector *v, int index, ToKen *item)
{
    if (index >= 0 && index < v->total)
        v->items[index] = item;
}

char *vector_get(vector *v, int index)
{
    if (index >= 0 && index < v->total)
        return v->items[index];
    return NULL;
}

void vector_delete(vector *v, int index)
{
int i = 0;
    if (index < 0 || index >= v->total)
        return;

    v->items[index] = NULL;
	
    for (i = 0; i < v->total - 1; i++) {
        v->items[i] = v->items[i + 1];
        v->items[i + 1] = NULL;
    }

    v->total--;

    if (v->total > 0 && v->total == v->capacity / 4)
        vector_resize(v, v->capacity / 2);
}

void vector_free(vector *v)
{
    free(v->items);
}

vector Tokens;
int i = -1;
int maxi = -1;

void create_and_store_token(char* s, int type, int line)
{
	int Len = (strlen(s)+1);

	ToKen* t = (ToKen*)calloc(1, sizeof(ToKen));
	t->type = type;
	t->line = line;
	t->a = (char*)calloc(Len,sizeof(char));
	strcpy(t->a,s);
	vector_add(&Tokens, t);
}

char* next_token()
{
	int type;
	i++;

	if (maxi < i)
	{
		type = yylex();

		if (!type)
		{
			return NULL;
		}
		maxi = i;
		create_and_store_token(yytext,type, line);		
	}

	return vector_get(&Tokens, i);
}

char* back_token()
{
	if (i > 0 )
	{
		i--;
		return vector_get(&Tokens, i);
	}
	return NULL;
}

void clear_vector()
{
	int i;
	for(i = 0; i < Tokens.total; i++)
	{
		free(Tokens.items[i]->a);
		free(Tokens.items[i]);
	}
	vector_free(&Tokens);
}

void main()
{
 FILE* testIn; 
 ToKen* Token;
 int choice;

 vector_init(&Tokens);

 printf("choose file: 1 or 2:\n");
 scanf("%d",&choice);

 if (choice == 1)
 {
	fopen_s(&testIn, TEST_IN_FILE1, "r");
	fopen_s(&testOut, TEST_OUT_FILE1, "w");
 }
 else if (choice == 2)
 {
	fopen_s(&testIn, TEST_IN_FILE2, "r");
	fopen_s(&testOut, TEST_OUT_FILE2, "w");
 }
 else
 {
	return 0;
 }
  
 yyin = testIn;
 yyout = testOut;

 while(next_token() != NULL);
 
fclose(testIn);
fclose(testOut);

clear_vector();
}