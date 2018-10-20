#include <bits/stdc++.h>

using namespace std;

map<pair<string, string>, string> cache;

// naive recursive solution:
//
// if s1 == "" or s2 == "":
//   return ""
//
// if s1[last] == s2[last]:
//   return lcs(s1[:last], s2[:last]) + s1[last]
// else:
//   a = lcs(s1, s2[:last])
//   b = lcs(s1[:last], s2)
//   if len(a) > len(b):
//      return a
//   else:
//      return b
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
