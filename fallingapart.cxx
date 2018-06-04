#include <algorithm>
#include <iostream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int main() {
    string s;
    getline(cin, s);
    int n = stoi(s);

    getline(cin, s);
    istringstream iss(s);
    vector<int> nums(istream_iterator<int>{iss}, istream_iterator<int>());

    int values[] = {0, 0}; // [0] = alice, [1] = bob
    int turn = 0;
    while (!nums.empty()) {
        auto maximum_iter = max_element(nums.begin(), nums.end());
        int maximum = *maximum_iter;
        nums.erase(maximum_iter);
        values[turn] += maximum;
        turn = !turn;
    }
    cout << values[0] << " " << values[1] << '\n';
}
