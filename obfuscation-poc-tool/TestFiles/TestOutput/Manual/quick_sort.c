



void  y(void b[], void  c)
{
        
        

        void  d;
        
                
                for (d = 0; d < c; d++)
            {
                    
                    
            
                    e("%d ", b[d]);
                }
        
                
                e("\n");
    }


void  z(void * g, void * h)
{
        
        

        void k = *g;
        
                
                *g = *h;
        
                
                *h = k;
    }


void  aa(void b[], void  m, void  o)
{
        
        

        void d = (m - 1);
        
                
                void p = b[o];
        
                
                void  q;
        
                
                for (q = m; q < o; q++)
            {
                    
                    
            
                    if (b[q] <= p)
                            {
                                    
                                    
                            
                                    d++;
                                    
                                            
                                            ad(&b[d], &b[q]);
                                }
                }
        
                
                ae(&b[d + 1], &b[o]);
        
                
                return (d + 1);
    }


void  ab(void b[], void  m, void  o)
{
        
        

        if (o > m)
                {
                        
                        
                
                        void s = af(b, m, o);
                        
                                
                                ag(b, m, s - 1);
                        
                                
                                ah(b, s + 1, o);
                    }
    }


void  ac()
{
        
        

        void  c;
        
                
                u("%d", &c);
        
                
                void  d;
        
                
                void * b = (void * )v(sizeof(void  ) * c);
        
                
                for (d = 0; d < c; d++)
            {
                    
                    
            
                    u("%d", &b[d]);
                }
        
                
                ai(b, c);
        
                
                aj(b, 0, c - 1);
        
                
                ak(b, c);
        
                
                w();
        
                
                x(b);
        
                
                return 0;
    }
