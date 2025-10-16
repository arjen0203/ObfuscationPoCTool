#include <am.h>
#include <an.h>

const int c = 10;
const int d = 99;
int e[c][c];
int f;
int g[c];
int h[c];
int k = 0;

void l(int m) {
    h[k++] = m;
}

int n(void *o, void *p) {
    int *r = (int *) o;
    int *g = (int *) p;
    return *g - *r;
}

int t() {
    w(h, k, sizeof(int), n);
    return h[--k];
}

int z() {
    return (k > 0);
}

int aa[c];
int ab = 0;

void ac(int ad) {
    g[ad] = 0;
    int ae;
    for (ae = 0; ae < f; ++ae) {
        if (ae != ad) {
            g[ae] = d;
        }
        l(ae);
    }
    while (z()) {
        int af = t();
        aa[ab++] = af;
        for (ae = 0; ae < f; ++ae) {
            if (e[af][ae]) {
                if (g[ae] > g[af] + e[af][ae]) {
                    g[ae] = g[af] + e[af][ae];
                }
            }
        }
    }
}

int ag(int ah, const char *ai[]) {
    aj("number ");
    ak(" %d", &f);
    aj("adj ");
    int ae, al;
    for (ae = 0; ae < f; ++ae) {
        for (al = 0; al < f; ++al) {
            ak(" %d", &e[ae][al]);
        }
    }
    ac(0);
    aj("\nDist\n");
    for (ae = 0; ae < f; ++ae) {
        aj("%d\t%d\n", ae, g[ae]);
    }
    return 0;
}
