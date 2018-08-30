#include <iostream>
#include <stdlib.h>
using namespace std;

template<class X, class R> R apply( R (*fun) (X), X arg )
{
	return fun(arg);
}

double sum10(int x)
{
	return x+10;
}

class People {
    public:
    	People(){}

    	//key point!!! virtual
        void virtual voice() { cout<<"жизнь прекрасна"<<endl;}
};

class Vodim : public People {
    public:
    	Vodim(){}
        void voice() { cout<<"жизнь говно"<<endl;}
};
//random_number = firs_value + rand() % last_value;

int main()
{
	int n = 10;
	People** society = new People*[n];
	Vodim* rahit = new Vodim();
	for(int i=0;i<n;i++)
	{

		society[i] = new People();
	}
	int random_number = 0 + rand() % n;
	society[random_number] = rahit;
	//cout<<apply(sum10,10);
	for(int i=0;i<n;i++)
	{
		society[i]->voice();
	}
	return 0;
}