#include <iostream>
#include <algorithm>
#include <vector>
#include <string>

using namespace std;

int main() {
    int r, c;
    cin >> r >> c;
    cin.ignore(1, '\n');

    vector<string> map;
    for (int row = 0; row < r; row++) {
        string tmp;
        getline(cin, tmp);
        map.push_back(tmp);
    }

    int total_spaces[] = {0, 0, 0, 0, 0};
    for (int row = 0; row < r - 1; row++) {
        for (int col = 0; col < c - 1; col++) {
            vector<char> spaces {
                map[row][col],
                map[row][col + 1],
                map[row + 1][col],
                map[row + 1][col + 1]
            };
            if (any_of(spaces.begin(), spaces.end(), [](char c) {
                return c == '#';
            })) {
                ; // can't park here
            } else {
                int cars = count(spaces.begin(), spaces.end(), 'X');
                total_spaces[cars]++;
            }
        }
    }

    cout << total_spaces[0] << '\n'
         << total_spaces[1] << '\n'
         << total_spaces[2] << '\n'
         << total_spaces[3] << '\n'
         << total_spaces[4] << '\n';
}
