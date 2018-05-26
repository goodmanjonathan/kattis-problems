#include <iostream>
#include <algorithm>
#include <vector>
#include <unordered_map>

using namespace std;

int main() {
    int n;
    vector<int> l1, l2;
    unordered_map<int, int> correspondences;

    while ((cin >> n) && n != 0) {
        int tmp;
        for (int i = 0; i < n; i++) {
            cin >> tmp;
            l1.push_back(tmp);
        }
        for (int i = 0; i < n; i++) {
            cin >> tmp;
            l2.push_back(tmp);
        }

        vector<int> sorted_l1(l1.begin(), l1.end());
        sort(sorted_l1.begin(), sorted_l1.end());
        sort(l2.begin(), l2.end());
        // this would be more clearly expressed with zip() if that existed
        for (
            auto i = sorted_l1.begin(), j = l2.begin();
            i != sorted_l1.end() && j != l2.end();
            i++, j++
        ) {
            correspondences[*i] = *j;
        }
        for (auto elem : l1)
            cout << correspondences[elem] << '\n';
        cout << '\n';

        l1.clear();
        l2.clear();
    }
}
