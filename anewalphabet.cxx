#include <iostream>
#include <cctype>
#include <unordered_map>
#include <string>

std::unordered_map<char, std::string> alphabet = {
    {'a', R"(@)"},
    {'b', R"(8)"},
    {'c', R"(()"},
    {'d', R"(|))"},
    {'e', R"(3)"},
    {'f', R"(#)"},
    {'g', R"(6)"},
    {'h', R"([-])"},
    {'i', R"(|)"},
    {'j', R"(_|)"},
    {'k', R"(|<)"},
    {'l', R"(1)"},
    {'m', R"([]\/[])"},
    {'n', R"([]\[])"},
    {'o', R"(0)"},
    {'p', R"(|D)"},
    {'q', R"((,))"},
    {'r', R"(|Z)"},
    {'s', R"($)"},
    {'t', R"('][')"},
    {'u', R"(|_|)"},
    {'v', R"(\/)"},
    {'w', R"(\/\/)"},
    {'x', R"(}{)"},
    {'y', R"(`/)"},
    {'z', R"(2)"}
};

int main() {
    std::string input;
    std::getline(std::cin, input);

    for (char c : input) {
        char lowered = std::tolower(c);
        if (lowered >= 'a' && lowered <= 'z')
            std::cout << alphabet[lowered];
        else
            std::cout << c;
    }
}
