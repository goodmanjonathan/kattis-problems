#include <iostream>
#include <sstream>
#include <iterator>
#include <vector>
#include <string>

using namespace std;

int main() {
    string s;

    getline(cin, s);
    int n = stoi(s);

    for (int i = 0; i < n; i++) {
        getline(cin, s);
        istringstream is(s);
        vector<int> ints(istream_iterator<int>{is}, istream_iterator<int>());

        int idx = 2;
        int prev = *(ints.begin() + 1);
        for (auto iter = ints.begin() + 2; iter != ints.end(); iter++, idx++) {
            if (*iter != prev + 1) {
                // found the king in this set
                cout << idx << '\n';
                break;
            }
            prev = *iter;
        }
    }
}
