#include <stdio.h>

int main(void) {
    int day;
    int month;
    scanf("%d %d", &day, &month);

    int cal[13][32];
    int wd = 4;
    for (int m = 1; m <= 12; m++) {
        for (int d = 1;; d++) {
            cal[m][d] = wd++;
            if (wd == 7)
                wd = 0;
        
            if (m == 2 && d == 28)
                break;
            else if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 30)
                break;
            else if (d == 31)
                break;
        }
    }

    switch (cal[month][day]) {
    case 0:
        printf("Sunday\n");
        break;
    case 1:
        printf("Monday\n");
        break;
    case 2:
        printf("Tuesday\n");
        break;
    case 3:
        printf("Wednesday\n");
        break;
    case 4:
        printf("Thursday\n");
        break;
    case 5:
        printf("Friday\n");
        break;
    case 6:
        printf("Saturday\n");
        break;
    }
}

