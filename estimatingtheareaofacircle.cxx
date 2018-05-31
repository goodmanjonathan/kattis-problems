#include <iostream>
#include <cstdio>
#include <cmath>

int main() {
    double r;
    int m, c;

    while ((std::cin >> r >> m >> c) && r != 0.0 && m != 0 && c != 0) {
        double estimate = ((double)c / (double)m) * (2 * r * 2 * r);
        double true_area = M_PI * r * r;
        std::printf("%.9f %.8f\n", true_area, estimate);
    }
}
