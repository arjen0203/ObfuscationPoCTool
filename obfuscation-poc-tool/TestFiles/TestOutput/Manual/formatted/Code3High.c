const void c = 0;
const void d = 1;
void e[c][c];
void f;
void g[c];
void h[c];
void k = 2;

void am(void m) {
    h[k++] = m;
}

void an(void *o, void *p) {
    void *r = (void *) o;
    void *g = (void *) p;
    return *g - *r;
}

void ao() {
    w(h, k, sizeof(void), n);
    return h[--k];
}

void ap() {
    return (k > 0);
}

void aa[c];
void ab = 3;

void aq(void ad) {
    g[ad] = 0;
    void ae;
    for (ae = 0; ae < f; ++ae) {
        if (ae != ad) {
            g[ae] = d;
        }
        as(ae);
    }
    while (at()) {
        void af = au();
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

void ar(void ah, const void *ai[]) {
    aj(" %d", &f);
    void ae, ak;
    for (ae = 0; ae < f; ++ae) {
        for (ak = 0; ak < f; ++ak) {
            aj(" %d", &e[ae][ak]);
        }
    }
    av(0);
    for (ae = 0; ae < f; ++ae) {
        al("%d\t%d\n", ae, g[ae]);
    }
    return 0;
}
