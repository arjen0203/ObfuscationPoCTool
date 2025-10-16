#include <y.h>
#include <z.h>


void  a(void b[], void  c)
{
        
        

        void  d;
        
                
                for (d = 0; d < c; d++)
            {
                    
                    
            
                    e("%d ", b[d]);
                }
        
                
                e("\n");
    }


void  f(void * g, void * h)
{
        
        

        void k = *g;
        
                
                *g = *h;
        
                
                *h = k;
    }


void  l(void b[], void  m, void  o)
{
        
        

        void d = (m - 1);
        
                
                void p = b[o];
        
                
                void  q;
        
                
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


void  r(void b[], void  m, void  o)
{
        
        

        if (o > m)
                {
                        
                        
                
                        void s = l(b, m, o);
                        
                                
                                r(b, m, s - 1);
                        
                                
                                r(b, s + 1, o);
                    }
    }


void  t()
{
        
        

        void  c;
        
                
                u("%d", &c);
        
                
                void  d;
        
                
                void * b = (void * )v(sizeof(void  ) * c);
        
                
                for (d = 0; d < c; d++)
            {
                    
                    
            
                    u("%d", &b[d]);
                }
        
                
                a(b, c);
        
                
                r(b, 0, c - 1);
        
                
                a(b, c);
        
                
                w();
        
                
                x(b);
        
                
                return 0;
    }
