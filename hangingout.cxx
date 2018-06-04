#include <iostream>
#include <string>

using namespace std;

int main() {
    int l, x;
    cin >> l >> x;

    int occupants = 0;
    int denied = 0;
    while (x-- > 0) {
        string event;
        int p;
        cin >> event >> p;
        if (event == "enter") {
            if (occupants + p <= l) {
                occupants += p;
            } else {
                denied++;
            }
        } else {
            occupants -= p;
        }
    }

    cout << denied << '\n';
}
