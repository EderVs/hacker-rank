#include <bits/stdc++.h>

using namespace std;

int dp[100000], numbers[100000], T, n, maximo = INT_MIN;

int f(int i) {
    int &r = dp[i];

    // Caso base
    if (i == 0) {
        r = numbers[i];
        maximo = r;
        return r;
    }

    r = max(f(i-1) + numbers[i], numbers[i]);
    maximo = max(maximo, r);
    return r;
}

int subsecuencia_mas_larga(int n) {
    int suma = 0, contador = 0, maxi = numbers[0];
    for (int i = 0; i < n; i++) {
        if (numbers[i] <= 0) {
            contador++;
            maxi = max(maxi, numbers[i]);
        } else {
            suma += numbers[i];
        }
    }
    if (contador == n) {
        return maxi;
    }
    return suma;
}

int main() {
    scanf("%d", &T);
    for (int i = 0; i < T; i++) {
        maximo = INT_MIN;
        scanf("%d", &n);
        for (int j = 0; j < n; j++) {
            cin >> numbers[j];
        }
        f(n-1);
        printf("%d %d\n", maximo, subsecuencia_mas_larga(n));
    }
    return 0;
}
