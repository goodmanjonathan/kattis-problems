#include <iostream>
#include <sstream>

void inc(char& c, int n) {
    while (n-- > 0) {
        if (c == 'Z')
            c = '_';
        else if (c == '_')
            c = '.';
        else if (c == '.')
            c = 'A';
        else
            c++;
    }
}

int main() {
    std::string line;
    while (std::getline(std::cin, line)) {
        std::istringstream stream(line);
        int n;
        std::string s;
        if (!(stream >> n >> s))
            break;
        std::string enc;
        for (auto iter = s.rbegin(); iter != s.rend(); iter++)
            enc += *iter;
        for (auto& c : enc)
            inc(c, n);
        std::cout << enc << '\n';
    }
}
