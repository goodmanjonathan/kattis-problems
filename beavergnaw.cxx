#include <iostream>
#include <cstdio>
#include <cmath>

int main() {
    double D, V;
    while ((std::cin >> D >> V) && !(D == 0. && V == 0.)) {
        double d = cbrt((3./2.)*D*D*D - 6*V/M_PI - D*D*D/2);
        std::printf("%.9f\n", d);
    }
}
