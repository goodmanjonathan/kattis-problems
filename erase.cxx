#include <iostream>

using namespace std;

int main() {
    string s;
    getline(cin, s);
    int n = stoi(s);

    string file;
    getline(cin, file);

    while (n-- > 0) {
        for (size_t i = 0; i < file.size(); i++) {
            if (file[i] == '0') {
                file[i] = '1';
            } else {
                file[i] = '0';
            }
        }
    }

    string deleted;
    getline(cin, deleted);

    if (file == deleted) {
        cout << "Deletion succeeded\n";
    } else {
        cout << "Deletion failed\n";
    }
}
