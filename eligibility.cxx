#include <bits/stdc++.h>

int main() {
    int n;
    scanf("%d", &n);
    
    while (n--) {
        char name[31], began[11], birth[11];
        unsigned courses;
        
        scanf("%30s %11s %11s %u", name, began, birth, &courses);
        
        const char *eligibility;
        if (strncmp(began, "2010", 4) >= 0
            || strncmp(birth, "1991", 4) >= 0
        ) {
            eligibility = "eligible";
        } else if (courses > 8 * 5) {
            eligibility = "ineligible";
        } else {
            eligibility = "coach petitions";
        }
        
        printf("%s %s\n", name, eligibility);
    }
}
