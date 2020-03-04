// ProgramDiagnostic.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "Function.h"
#include <random>

int k = 1;				// номер заболевания на входе
int kb_in = pow(2, k);  // входной код заболевания (нужен для определения правильности диагностики)
int m = 1000;			// количество статистических испытаний. 
double S = 0.03;		// СКО случайных отклонений от эталонных значений

int main()
{
	Diagnostic* dig = new Diagnostic(k, 8);
	int nCorrect = 0;
	for (int c = 0; c < m; c++) {
		dig->reset();
		dig->loadData("data.csv");
		random_device rd{};
		mt19937 gen{ rd() };
		normal_distribution<> d(0, 1);
		vector<vector<double>> noise;
		for (int i = 0; i < 24; i++) {
			vector<double> p;
			for (int j = 0; j < 8; j++)
				p.push_back(d(gen));
			noise.push_back(p);
		}
		dig->calculateS();
		dig->calculateSKO();
		dig->membershipFunction(noise, S);
		//dig->printData();
		int k_out = dig->predict();
		if (k_out == k)
			nCorrect++;
	}
	cout << "Accuracy: " << (double)(nCorrect*100.0 / m) << endl;
	system("pause");
	return 0;
}