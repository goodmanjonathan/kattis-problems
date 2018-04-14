#include <iostream>
#include <string>

void cond_swap(int& n, int left, int right) {
    if (n == left)
        n = right;
    else if (n == right)
        n = left;
}

int main() {
    std::string input;
    std::cin >> input;

    int ball_pos = 1;
    for (char c : input) {
        if (c == 'A')
            cond_swap(ball_pos, 1, 2);
        else if (c == 'B')
            cond_swap(ball_pos, 2, 3);
        else
            cond_swap(ball_pos, 1, 3);
    }

    std::cout << ball_pos << '\n';
}
