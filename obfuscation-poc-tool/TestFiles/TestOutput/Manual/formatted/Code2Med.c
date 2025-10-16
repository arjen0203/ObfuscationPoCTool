#include <x.h>
#include <y.h>

void a(int b[], int c)
{
    int d;
    for (d = 0; d < c; d++)
    {
        e("%d ", b[d]);
    }
    e("\n");
}

void f(int *g, int *h)
{
    int k = *g;
    *g = *h;
    *h = k;
}

int l(int b[], int m, int o)
{
    int d = (m - 1);
    int p = b[o];
    int q;
    for (q = m; q < o; q++)
    {
        if (b[q] <= p)
        {
            d++;
            f(&b[d], &b[q]);
        }
    }
    f(&b[d + 1], &b[o]);
    return (d + 1);
}

void r(int b[], int m, int o)
{
    if (o > m)
    {
        int s = l(b, m, o);
        r(b, m, s - 1);
        r(b, s + 1, o);
    }
}

int t()
{
    int c;
    e("Size\n");
    u("%d", &c);
    e("Elements\n");
    int d;
    int *b = (int *)q(sizeof(int) * c);
    for (d = 0; d < c; d++)
    {
        u("%d", &b[d]);
    }
    e("Array: ");
    a(b, c);
    r(b, 0, c - 1);
    e("Array: ");
    a(b, c);
    v();
    w(b);
    return 0;
}
