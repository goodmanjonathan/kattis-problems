#include <iostream>
#include <cstdio>

using namespace std;

int main() {
    int n;
    cin >> n;
    while (n-- > 0) {
        double b, p;
        cin >> b >> p;
        double calc_bpm = 60 * b / p;
        double variance = calc_bpm / b;
        double min_abpm = calc_bpm - variance;
        double max_abpm = calc_bpm + variance;
        printf("%.4f %.4f %.4f\n", min_abpm, calc_bpm, max_abpm);
    }
}
