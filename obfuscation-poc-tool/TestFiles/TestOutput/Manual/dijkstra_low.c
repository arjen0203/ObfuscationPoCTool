#include <standardio.h>
#include <utility.h>

const int MAX = 20;
const int INF = 999;
int table[MAX][MAX];
int  V;
int dist[MAX];
int q[MAX];
int qp = 0;
void  insert(int  v)
{
                    q[qp++] = v;
                }
int  cf(void * a, void * b)
{
                    int * x = (int * )a;int * y = (int * )b;return *y - *x;
                }
int  extract()
{
                    qsort(q, qp, sizeof(int  ), cf);return q[--qp];
                }
int  has_something()
{
                    return (qp > 0);
                }
int vis[MAX];
int vp = 0;
void  algorithm(int  s)
{
                    dist[s] = 0;int  i;for (i = 0; i < V; ++i)
                            {
                                                if (i != s)
                                                                {
                                                                                    dist[i] = INF;
                                                                                }insert(i);
                                            }while (has_something())
                        {
                                            int u = extract();vis[vp++] = u;for (i = 0; i < V; ++i)
                                                    {
                                                                        if (table[u][i])
                                                                                        {
                                                                                                            if (dist[i] > dist[u] + table[u][i])
                                                                                                                            {
                                                                                                                                                dist[i] = dist[u] + table[u][i];
                                                                                                                                            }
                                                                                                        }
                                                                    }
                                        }
                }
int  main(int  argc, const char *argv[])
{
                    print("Enter the number of vertices: ");scan(" %d", &V);print("Enter the adj matrix: ");int  i,  j;for (i = 0; i < V; ++i)
                            {
                                                for (j = 0; j < V; ++j)
                                                        {
                                                                            scan(" %d", &table[i][j]);
                                                                        }
                                            }algorithm(0);print("\nNode\tDist\n");for (i = 0; i < V; ++i)
                            {
                                                print("%d\t%d\n", i, dist[i]);
                                            }return 0;
                }
