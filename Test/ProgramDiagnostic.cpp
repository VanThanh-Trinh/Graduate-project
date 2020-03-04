// ProgramDiagnostic.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "Function.h"

int k = 8;				// номер заболевания на входе
int kb_in = pow(2, k);  // входной код заболевания (нужен для определения правильности диагностики)
int m = 1;				// количество статистических испытаний. 

int main()
{
	Diagnostic* dig = new Diagnostic(k, 8);
	dig->reset();
	dig->loadData("data.csv");
	dig->calculateS();
	dig->calculateSKO();
	dig->membershipFunction();
	dig->printData();
	dig->predict();
	system("pause");
	return 0;
}