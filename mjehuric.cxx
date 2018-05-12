#include <iostream>
#include <array>
#include <utility>

int main() {
    std::array<int, 5> arr;
    for (size_t i = 0; i < 5; i++)
        std::cin >> arr[i];

    do {
        for (size_t i = 1; i < arr.size(); i++) {
            if (arr[i - 1] > arr[i]) {
                std::swap(arr[i - 1], arr[i]);
                for (size_t i = 0; i < arr.size(); i++) {
                    if (i == 0)
                        std::cout << arr[i];
                    else
                        std::cout << ' ' << arr[i];
                }
                std::cout << '\n';
            }
        }
    } while (arr != std::array<int, 5>{1, 2, 3, 4, 5});
}

