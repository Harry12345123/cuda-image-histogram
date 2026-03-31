#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>

void histogram_cuda(const unsigned char *gray, int width, int height, unsigned int *hist256);

int main(int argc, char **argv)
{
    std::string input = argc > 1 ? argv[1] : "input.jpg";
    cv::Mat img = cv::imread(input, cv::IMREAD_GRAYSCALE);
    if (img.empty())
        return -1;
    std::vector<unsigned int> hist(256, 0);
    histogram_cuda(img.data, img.cols, img.rows, hist.data());
    for (int i = 0; i < 256; ++i)
    {
        std::cout << i << ": " << hist[i] << std::endl;
    }
    return 0;
}