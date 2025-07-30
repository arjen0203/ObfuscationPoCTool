#include <p.h>
#include <q.h>

int  b(int * c, int  d, int  e) {
        int  f;for (f = 0; f < d; f++) {
                if (c[f] == e) return 1;
            }return 0;
    }

int  g() {
        int  h,  f,  j;k("Size:\n");l("%d", &h);int * m = (int * )j(h * sizeof(int  ));k("contents: %d:\n", h);for (f = 0; f < h; f++) l("%d", &m[f]);k("Value:\n");l("%d", &j);if (b(m, h, j)) k("Value %d is in.\n", j); else k("Value %d is not in.\n", j);o(m);return 0;
    }
