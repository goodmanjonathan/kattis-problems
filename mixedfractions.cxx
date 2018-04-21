#include <iostream>

int main() {
    int numerator, denominator;

    while ((std::cin >> numerator >> denominator)
        && !(numerator == 0 && denominator == 0))
    {
        int whole = numerator / denominator;
        numerator %= denominator;
        std::cout << whole << " " << numerator << " / " << denominator << '\n';
    }
}
