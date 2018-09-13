#include <bits/stdc++.h>

using namespace std;

int dp_h[1000], N, M, T;
int max_bloques_horizontal(int i) {
    int &r = dp_h[i];

    if (r != -1) {
        return r;
    }

    // Casos Base
    if (i == 0) {
        r = 0;
        return r;
    }
    if (i == 1) {
        r = 1;
        return r;
    }
    if (i == 2) {
        r = 2;
        return r;
    }
    if (i == 3) {
        r = 4;
        return r;
    }
    if (i == 4) {
        r = 8;
        return r;
    }

    r = max_bloques_horizontal(i-4) + max_bloques_horizontal(i-3) + max_bloques_horizontal(i-2) + max_bloques_horizontal(i-1); 
    return r;
    
}

int main() {
    scanf("%d", &T);
    for (int i = 0; i < T; i++) {
        memset(dp_h, -1, sizeof(dp_h));
        scanf("%d %d", &N, &M);
        cout << max_bloques_horizontal(M) << endl;
    }
    return 0;
}
