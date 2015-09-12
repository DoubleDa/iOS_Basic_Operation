#include<stdio.h>
int main(){
	int a = 1;
	int b = 3;
	int c = 5;

	int *p1 = &a;
	int *p2 = &b;
	int *p = &c;
	*p = *p1 * (*p2);
	printf("%d\n",c);
	return 0;
}