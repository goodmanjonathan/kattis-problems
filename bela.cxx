#include <string>
#include <unordered_map>
#include <tuple>
#include <cstdio>

using namespace std;

unordered_map<char, tuple<int, int>> card_values {
    {'A', {11, 11}},
    {'K', {4, 4}},
    {'Q', {3, 3}},
    {'J', {20, 2}},
    {'T', {10, 10}},
    {'9', {14, 0}},
    {'8', {0, 0}},
    {'7', {0, 0}}
};

int main() {
    int n;
    char b;
    scanf("%d %c\n", &n, &b);

    int points = 0;
    for (int i = 0; i < 4 * n; i++) {
        char card, suit;
        scanf("%c%c\n", &card, &suit);
        auto value = card_values[card];
        if (suit == b) {
            points += get<0>(value);
        } else {
            points += get<1>(value);
        }
    }

    printf("%d\n", points);
}
