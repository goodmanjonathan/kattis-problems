#include <iostream>
#include <string>
#include <algorithm>
#include <iterator>

using namespace std;

char char_wrapping_add(char c, int x) {
    return (c - 'A' + x) % 26 + 'A';
}

int main() {
    string s;
    cin >> s;

    string h1 = s.substr(0, s.size() / 2);
    string h2 = s.substr(s.size() / 2, s.size());

    int h1_rotation = 0, h2_rotation = 0;
    for (auto c : h1) {
        h1_rotation += c - 'A';
    }
    for (auto c : h2) {
        h2_rotation += c - 'A';
    }

    string h1_rotated, h2_rotated;
    transform(h1.begin(), h1.end(), back_inserter(h1_rotated), [=](char c) {
        return char_wrapping_add(c, h1_rotation);
    });
    transform(h2.begin(), h2.end(), back_inserter(h2_rotated), [=](char c) {
        return char_wrapping_add(c, h2_rotation);
    });

    // zip h1_rotated with h2_rotated
    for (
        auto i = h1_rotated.begin(), j = h2_rotated.begin();
        i != h1_rotated.end();
        i++, j++
    ) {
        cout << char_wrapping_add(*i, *j - 'A');
    }

    cout << '\n';
}
