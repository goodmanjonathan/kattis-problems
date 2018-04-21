#include <iostream>

int main() {
    int a, b, c;
    std::cin >> a >> b >> c;

    char sigil1;
    char sigil2;
    if (a + b == c) {
        sigil1 = '+';
        sigil2 = '=';
    } else if (a - b == c) {
        sigil1 = '-';
        sigil2 = '=';
    } else if (a * b == c) {
        sigil1 = '*';
        sigil2 = '=';
    } else if (a / b == c) {
        sigil1 = '/';
        sigil2 = '=';
    } else if (b + c == a) {
        sigil1 = '=';
        sigil2 = '+';
    } else if (b - c == a) {
        sigil1 = '=';
        sigil2 = '-';
    } else if (b * c == a) {
        sigil1 = '=';
        sigil2 = '*';
    } else if (b / c == a) {
        sigil1 = '=';
        sigil2 = '/';
    }
        
    std::cout << a << sigil1 << b << sigil2 << c << '\n';
}
