#include <iostream>
#include <string>
#include <cctype>
#include <cmath>
#include <cstdio>

using namespace std;

constexpr double DIAMETER = 60;
constexpr double CIRCUMFERENCE = M_PI * DIAMETER;
constexpr double SECTOR = CIRCUMFERENCE / 28;

int char_pos(char c) {
    if (isalpha(c)) {
        return c - 'A';
    } else if (c == ' ') {
        return 'Z' - 'A' + 1;
    } else /* c == '\'' */ {
        return 'Z' - 'A' + 2;
    }
}

int main() {
    string s;

    getline(cin, s);
    int n = stoi(s);

    while (n-- > 0) {
        getline(cin, s);

        char current = s.front();
        double time = 1; // for initial pickup

        for (auto iter = s.begin() + 1; iter != s.end(); iter++) {
            double distance_to_next = abs(char_pos(*iter) - char_pos(current)) * SECTOR;
            if (distance_to_next > CIRCUMFERENCE / 2) {
                distance_to_next = CIRCUMFERENCE - distance_to_next;
            }
            time += 1 + distance_to_next / 15;
            current = *iter;
        }

        printf("%.10f\n", time);
    }
}
