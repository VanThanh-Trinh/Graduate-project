#include "Function.h"


Diagnostic::Diagnostic()
{
	k = 1;
	nd = 8;
}

Diagnostic::Diagnostic(int k_, int nd_)
{
	k = k_;
	nd = nd_;
}

Diagnostic::~Diagnostic()
{
}

void Diagnostic::loadData(string path)
{
	matrixA.clear();
	vectorB.clear();
	ifstream input;
	input.open(path);
	if (!input.is_open())
		cout << "Path is incorrect \n";
	string data = "";
	while (input.good())
	{
		vector<double> rws;
		for (int i = 0; i < nd; i++) {
			getline(input, data, ';');
			rws.push_back(atof(data.c_str()));
		}
		for (int i = 0; i < nd; i++) {
			if (i != (nd - 1))
				getline(input, data, ';');
			else
				getline(input, data);
			if (i == (k - 1))
				vectorB.push_back(atof(data.c_str()));
		}
		matrixA.push_back(rws);
	}
	input.close();
}

void Diagnostic::printData()
{
	cout << "						Data loaded: \n";
	for (int i = 0; i < NP; i++) {
		for (int j = 0; j < nd; j++)
			cout << matrixA[i][j] << " ";
		cout << " | " << vectorB[i] << endl;
	}
	cout << "						********\n";
	cout << "sA: \n";
	for (int i = 0; i < nd; i++)
		cout << sA[i] << " ";
	cout << "\nsB: " << sB << endl;
	cout << "						********\n";
	cout << "skoA: \n";
	for (int i = 0; i < nd; i++)
		cout << skoA[i] << " ";
	cout << "\nskoB: " << skoB << endl;
	cout << "						********\n";
	cout << "Membership Function: \n";
	if (method == 1) {
		for (int i = 0; i < nd; i++)
			cout << mf[i] << " ";
		cout << endl;
	}
	else {
		for (int j = 0; j < NP; j++) {
			for (int i = 0; i < nd; i++)
				cout << mfComponent[i][j] << " ";
			cout << endl;
		}
		cout << "						********\n";
		cout << "Voting Parameter: \n";
		for (int j = 0; j < NP; j++) {
			for (int i = 0; i < nd; i++)
				cout << votingParameter[i][j] << " ";
			cout << endl;
		}
		cout << "						********\n";
		cout << "Voting Component Before: \n";
		for (int j = 0; j < 6; j++) {
			for (int i = 0; i < nd; i++)
				cout << votingComponentBefore[i][j] << " ";
			cout << endl;
		}
		cout << "						********\n";
		cout << "Voting Component After: \n";
		for (int i = 0; i < 6; i++) {
			for (int j = 0; j < nd; j++)
				cout << votingComponentAfter[i][j] << " ";
			cout << endl;
		}
		cout << "						********\n";
		cout << "Voting Global: \n";
		for (int i = 0; i < nd; i++)
			cout << votingGlobal[i] << " ";
		cout << endl;
	}
}

void Diagnostic::calculateS()
{
	sA.clear();
	for (int i = 0; i < nd; i++) {
		double s_a = 0;
		for (int j = 0; j < NP; j++) {
			s_a += matrixA[j][i];
		}
		sA.push_back(s_a / (double)NP);
	}
	sB = 0;
	for (int j = 0; j < NP; j++) {
		sB += vectorB[j];
	}
	sB = sB / (double)NP;
}

void Diagnostic::calculateSKO()
{
	skoA.clear();
	for (int i = 0; i < nd; i++) {
		double sko = 0;
		for (int j = 0; j < NP; j++) {
			sko += pow(matrixA[j][i] - sA[i], 2);
		}
		skoA.push_back(sko);
	}
	skoB = 0;
	for (int j = 0; j < NP; j++) {
		skoB += pow(vectorB[j] - sB, 2);
	}
}

void Diagnostic::membershipFunction()
{
	mf = vector<double>(nd, 0);
	for (int i = 0; i < nd; i++) {
		for (int j = 0; j < NP; j++) {
			mf[i] += ((matrixA[j][i] - sA[i])*(vectorB[j] - sB));
		}
		mf[i] /= (sqrt(skoA[i] * skoB));
	}
	////////// MF for component ///////
	for (int i = 0; i < nd; i++) {
		vector<double> p;
		for (int j = 0; j < NP; j++) {
			p.push_back(1.0 - abs(matrixA[j][i] - vectorB[j]));
		}
		mfComponent.push_back(p);
	}
	for (int i = 0; i < nd; i++) {
		vector<int> p;
		for (int j = 0; j < NP; j++) {
			p.push_back(0);
			if (mfComponent[i][j] >= BT)
				p[j] = 1;
		}
		votingParameter.push_back(p);
	}
	for (int i = 0; i < nd; i++) {
		vector<int> p(6, 0);
		for (int j = 0; j < NP; j++) {
			p[j / 4] += votingParameter[i][j];
		}
		votingComponentBefore.push_back(p);
	}
	for (int i = 0; i < 6; i++) {
		vector<int> p(nd, 0);
		int maxV = 0;
		for (int j = 0; j < nd; j++)
			if (votingComponentBefore[j][i] > maxV)
				maxV = votingComponentBefore[j][i];
		for (int j = 0; j < nd; j++) {
			if (votingComponentBefore[j][i] == maxV && maxV != 0)
				p[j] = 1;
		}
		votingComponentAfter.push_back(p);
	}
	votingGlobal = vector<int>(nd, 0);
	for (int i = 0; i < nd; i++) {
		for (int j = 0; j < 6; j++)
			votingGlobal[i] += votingComponentAfter[j][i];
	}
}

void Diagnostic::predict()
{
	if (method == 1) {
		double id = 0, mfMax = 0;
		for (int i = 0; i < nd; i++) {
			if (mf[i] > mfMax) {
				id = i + 1;
				mfMax = mf[i];
			}
		}
		cout << "						********\n";
		cout << "Input: " << k << " | Predict: ";
		if (mfMax >= BT)
			cout << id << endl;
		else
			cout << "unknown \n";
	}
	else {
		int maxV = *max_element(votingGlobal.begin(), votingGlobal.end()), id = 0;
		cout << "						********\n";
		cout << "Input: " << k << " | Predict: ";
		if (maxV == 0) {
			cout << "unknown \n";
		}
		else {
			for (int i = 0; i < nd; i++)
				if (votingGlobal[i] == maxV)
					id = i + 1;
			cout << id << endl;
		}
	}
}
