#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using namespace std;
using Char = string::value_type;

template<typename T>
vector<vector<T>> rtranspose(const vector<vector<T>>& v) {
    vector<vector<T>> transposed;
    auto len = v.size();
    for (int col = len - 1; col >= 0; col--) {
        vector<T> new_row;
        for (int row = 0; row < len; row++)
            new_row.push_back(v[row][col]);
        transposed.push_back(new_row);
    }
    return transposed;
}

int main() {
    string s;

    getline(cin, s);
    int n = stoi(s);

    while (n-- > 0) {
        getline(cin, s);

        int side_len = sqrt(s.size());
        vector<vector<Char>> square;
        for (int i = 0; i < side_len; i++) {
            vector<Char> tmp;
            for (int j = 0; j < side_len; j++)
                tmp.push_back(s[i * side_len + j]);
            square.push_back(tmp);
        }

        auto transposed = rtranspose(square);

        for (const auto& row : transposed) {
            for (char c : row) {
                cout << c;
            }
        }

        cout << '\n';
    }
}
