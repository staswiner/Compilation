#pragma once
typedef struct {
	int type;
	char* name;
}Word;
typedef struct {
	Word **words;
	int capacity;
	int total;
}Sentence;
typedef struct {
	char* a;
	int type;
	int line;
} Token;

typedef struct {
	Token **items;
	int capacity;
	int total;
} TokenVector;


Sentence CurrentSentence;
Word CurrentWOrd;

void create_and_store_token(char* s, int type, int line);
void vector_init(TokenVector *);
int vector_total(TokenVector *);
static void vector_resize(TokenVector *, int);
void vector_add(TokenVector *, char *);
void vector_set(TokenVector *, int, char *);
char *vector_get(TokenVector *, int);
void vector_delete(TokenVector *, int);
void vector_free(TokenVector *);

//void next_token()
//{
//
//}