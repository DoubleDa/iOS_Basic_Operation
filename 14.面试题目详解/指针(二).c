#include<stdio.h>
int main(){
	int a=10,b=20,c=30;
	int *p[3] = {&a,&b,&c};// p是一个数组 类型是指针类型 int*
	printf("%d\n",*(p[0]));

	int arr[3] = {1,2,3}; 
	int (*q)[3] = &arr;	// p为指向数组的指针
	printf("%d\n",(*q)[0]);
}
