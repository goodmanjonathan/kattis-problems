#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

bool continguous3(int a, int b, int c) {
    if ((a + 1 == b && a + 2 == c)        // a b c
        || (a + 1 == c && a + 2 == b)     // a c b
        || (b + 1 == a && b + 2 == c)     // b a c
        || (b + 1 == c && b + 2 == a)     // b c a
        || (c + 1 == a && c + 2 == b)     // c a b
        || (c + 1 == b && c + 2 == a)     // c b a
    ) {
        return true;
    } else {
        return false;
    }
}

int main() {
    int a, b, c;
    cin >> a >> b >> c;

    int moves = 0;
    while (!continguous3(a, b, c)) {
        vector<int*> v {&a, &b, &c};
        sort(v.begin(), v.end(), [](int* a, int* b) {
            return *a < *b;
        });
        int* minimum = v.at(0);
        int* maximum = v.at(2);
        int* neither = v.at(1);

        if (*neither - *minimum > *maximum - *neither) {
            // right outside to left outside
            *maximum = *minimum + 1;
        } else {
            // left outside to right outside
            *minimum = *maximum - 1;
        }

        moves++;
    }

    cout << moves;
}
