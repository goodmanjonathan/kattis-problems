#include <algorithm>
#include <map>
#include <set>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

vector<string> split(const string &s, char delim) {
    vector<string> v;
    string tmp;
    istringstream in(s);
    while (getline(in, tmp, delim))
        v.push_back(tmp);
    return v;
}

int klass_to_int(const string &s) {
    if (s == "upper")
        return 3;
    else if (s == "middle")
        return 2;
    else
        return 1;
}

int main() {  
    int t;
    cin >> t;
    
    while (t--) {
        int n;
        cin >> n;
        
        map<int64_t, set<string>> m;

        while (n--) {
            string name;
            cin >> name;
            name = name.substr(0, name.size() - 1);
            
            string klass;
            cin >> klass;
            
            string _klass_word;
            cin >> _klass_word;
            
            auto klass_list = split(klass, '-');
            
            vector<int> ints;
            transform(
                klass_list.rbegin(),
                klass_list.rend(),
                back_inserter(ints),
                klass_to_int
            );
            int padding = 10 - ints.size();
            while (padding--)
                ints.push_back(2);
            int64_t n = 0;
            for (int i : ints) {
                n = 10 * n + i;
            }
            
            if (m.find(n) == m.end())
                m.insert(make_pair(n, set<string>{}));
            m[n].insert(name);
        }
        
        for (auto iter = m.rbegin(); iter != m.rend(); iter++) {
            for (auto name : iter->second)
                cout << name << '\n';
        }
        cout << string(30, '=') << '\n';
    }
}
