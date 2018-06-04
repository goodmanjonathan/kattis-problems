#include <iostream>
#include <string>

using namespace std;

int main() {
    string s;

    getline(cin, s);
    int n = stoi(s);

    int battles_won = n;
    while (n-- > 0) {
        getline(cin, s);
        char prev = '\0';
        for (auto c : s) {
            if (prev == 'C' && c == 'D')
                battles_won--;
            prev = c;
        }
    }

    cout << battles_won << '\n';
}
