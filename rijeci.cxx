#include <iostream>

int main() {
    int k;
    std::cin >> k;
    int as = 1;
    int bs = 0;
    while (k-- > 0) {
        int tmp = as;
        as = bs;
        bs += tmp;
    }
    std::cout << as << " " << bs << '\n';
}
