#include <iostream>
#include <utility>
#include <vector>

using namespace std;

int inssort(vector<int> &a) {
    int steps_back = 0;
    for (int i = 1; i < a.size(); i++) {
        for (int j = i; j > 0 && a[j - 1] > a[j]; j--) {
            swap(a[j - 1], a[j]);
            steps_back++;
        }
    }
    return steps_back;
}

int main() {
    int p;
    cin >> p;

    while (p--) {
        int k;
        vector<int> heights;
        
        cin >> k;
        for (int i = 0; i < 20; i++) {
            int tmp;
            cin >> tmp;
            heights.push_back(tmp);
        }

        cout << k << ' ' << inssort(heights) << '\n';
    }
}
