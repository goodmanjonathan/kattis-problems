#include <bits/stdc++.h>

using namespace std;

map<pair<string, string>, string> cache;

string longest_common_subsequence(string s1, string s2) {
    if (s1.empty() || s2.empty())
        return "";
    auto iter = cache.find(make_pair(s1, s2));
    if (iter != cache.end())
        return iter->second;

    size_t n = s1.size(), m = s2.size();
    string result;

    if (s1[n - 1] == s2[m - 1])
        result = longest_common_subsequence(
                s1.substr(0, n - 1),
                s2.substr(0, m - 1)) + s1[n - 1];
    else {
        string a = longest_common_subsequence(
                    s1.substr(0, n - 1),
                    s2
                );
        string b = longest_common_subsequence(
                    s2.substr(0, m - 1),
                    s1
                );
        if (a.size() > b.size())
            result = a;
        else
            result = b;
    }

    cache[make_pair(s1, s2)] = result;
    return result;
} 

int main() {
    string s;
    cin >> s;

    string alphabet = "abcdefghijklmnopqrstuvwxyz";

    cout << (26 - longest_common_subsequence(s, alphabet).size()) << '\n';
}
