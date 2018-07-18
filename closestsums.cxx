#include <cstdio>
#include <cstring>
#include <cmath>

int main() {
    int n;
    int tcase = 1;
    const int len = 1000 * (1000 + 1) / 2;
    int *sums = new int[len];
    
    while (scanf("%d", &n) == 1) {
        printf("Case %d:\n", tcase);
        memset(sums, 0, sizeof(int) * len);
        
        int is[1000];
        for (int i = 0; i < n; i++)
            scanf("%d", &is[i]);
            
        int m;
        scanf("%d", &m);
        
        int qs[24];
        for (int i = 0; i < m; i++)
            scanf("%d", &qs[i]);
        
        int x = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                sums[x] = is[i] + is[j];
                x++;
            }
        }
        
        int closest[24];
        for (int q = 0; q < m; q++) {
            int minimum = sums[0];
            for (int i = 1; i < x; i++)
                if (fabs(sums[i] - qs[q]) < fabs(minimum - qs[q]))
                    minimum = sums[i];
            closest[q] = minimum;
        }
        
        for (int q = 0; q < m; q++)
            printf("Closest sum to %d is %d.\n", qs[q], closest[q]);
        
        tcase++;
    }
    delete[] sums;
}
