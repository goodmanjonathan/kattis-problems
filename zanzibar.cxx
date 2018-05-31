#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <iterator>

using namespace std;

int main() {
    string s;

    getline(cin, s);
    int t = stoi(s);

    while (t-- > 0) {
        getline(cin, s);
        istringstream iss(s);
        vector<int> turtles(istream_iterator<int>{iss}, istream_iterator<int>());

        int lower_bound = 0;
        int prev = 1;
        for (auto iter = turtles.begin(); *iter != 0; iter++) {
            if (*iter == 1)
                continue;
            if (*iter > 2 * prev)
                lower_bound += *iter - 2 * prev;
            prev = *iter;
        }

        cout << lower_bound << '\n';
    }
}
