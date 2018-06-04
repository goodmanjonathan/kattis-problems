#include <algorithm>
#include <iostream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int main() {
    string s;

    int i = 0;
    while (getline(cin, s)) {
        istringstream iss(s);
        vector<int> nums(istream_iterator<int>{iss}, istream_iterator<int>());

        int minimum = *min_element(nums.begin() + 1, nums.end());
        int maximum = *max_element(nums.begin() + 1, nums.end());
        int range = maximum - minimum;

        cout << "Case " << (i + 1) << ": "
             << minimum << " "
             << maximum << " "
             << range << '\n';
        i++;
    }
}
