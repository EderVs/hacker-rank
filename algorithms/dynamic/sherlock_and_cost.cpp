#include <bits/stdc++.h>

using namespace std;

int n, t, b[100000];

int h(int n) {
    int one = 0, number = 0, one_next, number_next;
    int one_to_number;
    int number_to_one;
    int number_to_number;
    for (int j = 1; j < n; j++) {
        one_to_number = abs(1 - b[j]);
        number_to_one = abs(1 - b[j-1]);
        number_to_number = abs(b[j] - b[j-1]);

        one_next = max(one, number + number_to_one);
        number_next = max(one+one_to_number, number + number_to_number);

        one = one_next;
        number = number_next;
    }

    return max(one, number);
}

int main() {
    cin >> t;
    for (int j = 0; j < t; j++) {

        cin >> n;
        for (int k = 0; k < n; k++) {
            cin >> b[k];
        }

        cout << h(n) << endl;
    }

}
