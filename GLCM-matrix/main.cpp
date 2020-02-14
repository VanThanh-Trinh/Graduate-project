#include <iostream>
#include <opencv2/opencv.hpp> // Trong opencv, khong gian mau luon la BGR
#include <Windows.h>
#include <fstream>
#include "GLCM.h"


using namespace cv;

GLCM* glcm = new GLCM(GRAY_8);
ChannelRGB lsChannel[6] = { CHANNEL_R, CHANNEL_G, CHANNEL_B, CHANNEL_RG, CHANNEL_RB, CHANNEL_GB };
char nameChannel[6][50] = { "Channel Red", "Channel Green", "Channel Blue", "Channel Red-Green", "Channel Red-Blue", "Channel Green-Blue" };

void work(Mat &img, std::ofstream &outFile)
{
	for (int i = 0; i < 6; i++) {
		std::cout << nameChannel[i] << std::endl;
		glcm->reset();

		Mat imgComponent = glcm->getImgByChannel(img, lsChannel[i]);

		glcm->calculateMatrix(imgComponent, 2, 0);
		//glcm->printMatrix();
		glcm->normalizeMatrix();

		glcm->calculateFeatures();
		glcm->printFeatures_Haralick(outFile);
	}
}

int main()
{	
	std::ofstream outFile;
	/*std::string folder = "10/";
	outFile.open("I:/GradEs/NormalizationRes/GoodResult/" + folder + "res.csv");*/
	outFile.open("I:/GradEs/NormalizationRes/GoodResult/All_Parameters.csv");
	if (!outFile.is_open())
		exit(-1);
	
	for (int i = 1; i <= 10; i++) {
		std::cout << " Folder: " << i << std::endl;
		std::string folder = std::to_string(i) + "/";
		std::string path("I:/GradEs/NormalizationRes/GoodResult/" + folder);
		path.append("\\*");
		WIN32_FIND_DATA data;
		HANDLE hFind;
		if ((hFind = FindFirstFile(path.c_str(), &data)) != INVALID_HANDLE_VALUE) {
			do {
				std::cout << "			Working on file: " << data.cFileName << std::endl;

				std::string filePath("I:/GradEs/NormalizationRes/GoodResult/" + folder);
				filePath.append(data.cFileName);
				Mat img = imread(filePath);
				if (img.rows != 0 && img.cols != 0) {
					outFile << data.cFileName << ",";
					work(img, outFile);
					outFile << std::endl;
				}
				std::cout << "           *** Finished on this file*** \n";

			} while (FindNextFile(hFind, &data) != 0);
			FindClose(hFind);
		}
	}
	
	/*Mat img = imread("I:/GradEs/NormalizationRes/GoodResult/Dark_brown_spotting/Screen Shot 2018-10-07 at 20.22.20.png");
	imshow("Input img", img);

	outFile.open("I:/GradEs/NormalizationRes/GoodResult/temp.csv");
	work(img, outFile);*/

	waitKey(0);
	destroyAllWindows();
	system("pause");
	outFile.close();
	delete glcm;
	return 0;
}
