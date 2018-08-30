#include <iostream>
#include <stdlib.h>
using namespace std;

//обобщенная функция
/*
template<class X> void show (X arg)
{
	cout<<arg<<endl;
}
*/
template<class T> void show(T* m, int n)
{
	for(int i=0;i<n;i++)
	{
		cout<<m[i]<<" ";
	}
	cout<<endl;
}

template<class X> void sort(X* m, int n)
{
	//отобюражение несортированного массива
	show(m,n);

	//локальная переменная обобщающего типа
	X s;
	//вложенные операторы цикла
	for(int i=1;i<=n-1;i++)
	{
		for(int j=0;j<n-i;j++)
		{
			if(m[j]>m[j+1])
			{
				s=m[j+1];
				m[j+1]=m[j];
				m[j]=s;
			}
		}
	}
	//отображение отсортированного массива
	show(m,n);
}

int main()
{
	/*
	show('A');
	show("Text");
	show(123);
	*/
	int A[5]={3,2,8,1,0};
	char B[7]={'Z','B','Y','A','D','C','X'};
	sort(A,5);
	sort(B,7);
	return 0;
}