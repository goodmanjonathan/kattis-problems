unsigned long long fibonacci(unsigned n) {
    unsigned long long prev2 = 0, prev1 = 1, result;
    if (n < 2)
        return n;
    for (unsigned i = 2; i <= n; i++) {
        result = prev2 + prev1;
        prev2 = prev1;
        prev1 = result;
    }
    return result;
}
