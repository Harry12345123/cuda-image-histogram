#include <cuda_runtime.h>

__global__ void histogram_kernel(const unsigned char *gray, int total, unsigned int *hist)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < total)
    {
        atomicAdd(&hist[gray[idx]], 1);
    }
}

void histogram_cuda(const unsigned char *gray, int width, int height, unsigned int *hist256)
{
    int total = width * height;
    size_t img_bytes = total;
    size_t hist_bytes = 256 * sizeof(unsigned int);
    unsigned char *d_gray = nullptr;
    unsigned int *d_hist = nullptr;
    cudaMalloc(&d_gray, img_bytes);
    cudaMalloc(&d_hist, hist_bytes);
    cudaMemcpy(d_gray, gray, img_bytes, cudaMemcpyHostToDevice);
    cudaMemset(d_hist, 0, hist_bytes);
    int block = 256;
    int grid = (total + block - 1) / block;
    histogram_kernel<<<grid, block>>>(d_gray, total, d_hist);
    cudaDeviceSynchronize();
    cudaMemcpy(hist256, d_hist, hist_bytes, cudaMemcpyDeviceToHost);
    cudaFree(d_gray);
    cudaFree(d_hist);
}