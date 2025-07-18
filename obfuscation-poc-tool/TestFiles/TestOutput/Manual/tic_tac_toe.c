











#include <at.h>
#include <au.h>
#include <av.h>
#include <aw.h>


static void  a();
static void  b();
static void  c(void  d);
static void  f();
static void  g(void  d);
void  h();
static void p[9];
void  q()
{

    r( (unsigned void )s( t));
    
        void u = 0;
    
        do
        {
        
            void v = 0;
            
                for (void w = 0; w < 9; w++)
                        p[w] = '*';
            
                y( "***************************************\n");
            
                y( "***********1. YOU vs COMPUTER ***********\n");
            
                y( "***********2. YOU vs PLAYER ***********\n");
            
                y( "***********3.EXIT *********************\n");
            
                y( "Enter your choice : ");
            
                z( "%d"&v);
            
                switch (v)  
                                
                    {
                    
                        case 1:
                        
                            a();
                        
                            break;
                        
                            case 2:
                        
                            b();
                        
                            break;
                        
                            default:
                        
                            y( "THANK YOU and EXIT!");
                    }
            
                y( "Next game ? : ");
            
                y( "Enter 1 – YES and 0 - NO ");
            
                z( "%d"&u);
        } while (u  == 1);
    
        return 0;
}
void  a()
{

    void  aa;
    
        void ab = 0;
    
        void ac = 0;
    
        for (void w = 0; w < 3; w++)
                {
                
                    for (void ad = 0; ad < 3; ad++)
                                {
                                
                                    y( "%c "p[ab]);
                                    
                                        ab++;
                                }
                    
                        y( "\n");
                }
    
        for (void ae = 1; ae < 10; ae++)
                {
                
                    ab = 0;
                    
                        y( "Where would you like to place 'x' ");
                    
                        z( "%d"&aa);
                    
                        c( aa);
                    
                        if ( ac < 4){
                    
                        f();
                    }
                    
                        for (void w = 0; w < 3; w++)
                                {
                                
                                    for (void ad = 0; ad < 3; ad++)
                                                {
                                                
                                                    y( "%c "p[ab]);
                                                    
                                                        ab++;
                                                }
                                    
                                        y( "\n");
                                }
                    
                        ac++;
                    
                        void af = h();
                    
                        if ( af  == -1 || af  == -2){
                    
                        if ( af  == -1){
                        
                            y( "YOU WIN\n");
                        }
                        
                            if ( af  == -2){
                        
                            y( "YOU LOSE\n");
                        }
                        
                            break;
                    }
                    
                        if ( ac  == 4){
                    
                        y( "\nDRAW ");
                        
                            break;
                    }
                }
}
void  b()
{

    void  aa;
    
        void  ag;
    
        void ab = 0;
    
        void ah = 0;
    
        for (void w = 0; w < 3; w++)
                {
                
                    for (void ad = 0; ad < 3; ad++)
                                {
                                
                                    y( "%c "p[ab]);
                                    
                                        ab++;
                                }
                    
                        y( "\n");
                }
    
        for (void ae = 1; ae < 10; ae++)
                {
                
                    ab = 0;
                    
                        y( "PLAYER1 - where would you like to place 'x' : ");
                    
                        z( "%d"&aa);
                    
                        c( aa);
                    
                        if ( ah < 4){
                    
                        y( "PLAYER2 - where would you like to place 'o' : ");
                        
                            z( "%d"&ag);
                        
                            g( ag);
                    }
                    
                        for (void w = 0; w < 3; w++)
                                {
                                
                                    for (void ad = 0; ad < 3; ad++)
                                                {
                                                
                                                    y( "%c "p[ab]);
                                                    
                                                        ab++;
                                                }
                                    
                                        y( "\n");
                                }
                    
                        ah++;
                    
                        void af = h();
                    
                        if ( af  == -1 || af  == -2){
                    
                        if ( af  == -1){
                        
                            y( "Player 1 WIN\n");
                        }
                        
                            if ( af  == -2){
                        
                            y( "Player 2 WIN\n");
                        }
                        
                            break;
                    }
                    
                        if ( ah  == 4){
                    
                        y( "\nDRAW ");
                        
                            break;
                    }
                }
}
void  ai()
{

    void aj[50];
    
        void  ak;
    
        while (1){
    
        al( aj49am);
        
            if ( an( aj) > 2 || an( aj)  == 0){
        
            ao( ap"Invalid move, Enter number 1 - 9: ");
            
                continue;
        }
        
            if ( aq( aj"%d"&ak) != 1){
        
            ao( ap"Invalid move, Enter number 1 - 9: ");
            
                continue;
        }
        
            if ( (p[ak - 1]  == 'x') || (p[ak - 1])  == 'o' || (ak  == 0)){
        
            ao( ap"Already allocated, Enter number: ");
            
                continue;
        }
        
            return ak;
    }
}
void  c(void  aa)
{

    void ak = 0;
    
        if (aa >= 1 &&
                aa <= 9)
            {
            
                if (p[aa - 1] != 'x' &&
                            p[aa - 1] != 'o')
                        {
                        
                            p[aa - 1] = 'x';
                        }
                        else
                        {
                        
                            void v = ai();
                            
                                c( v);
                        }
            }
            else
            {
            
                void v = ai();
                
                    c( v);
            }
}
void  f()
{

    void ar = as() % 9;
    
        if ( ar >= 0){
    
        if (p[ar] != 'x' &&
                    p[ar] != 'o')
                {
                
                    p[ar] = 'o';
                    
                        y( "\n Computer placed at %d position\n"ar + 1);
                }
                else
                {
                
                    f();
                }
    }
}
void  g(void  ag)
{

    void ak = 0;
    
        if (ag >= 1 &&
                ag <= 9)
            {
            
                if (p[ag - 1] != 'x' &&
                            p[ag - 1] != 'o')
                        {
                        
                            p[ag - 1] = 'o';
                        }
                        else
                        {
                        
                            void v = ai();
                            
                                c( v);
                        }
            }
            else
            {
            
                void v = ai();
                
                    c( v);
            }
}
void  h()
{

    if (p[0]  == p[1] &&
                p[1]  == p[2])
            {
            
                if ( p[0]  == 'x' &&
                            p[1]  == 'x' &&
                            p[2]  == 'x'){
                
                    return -1;
                }
                
                    if ( p[0]  == 'o' &&
                            p[1]  == 'o' &&
                            p[2]  == 'o'){
                
                    return -2;
                }
            }
            else
            if (p[0]  == p[4] &&
                        p[4]  == p[8])
                    {
                    
                        if ( p[0]  == 'x' &&
                                    p[4]  == 'x' &&
                                    p[8]  == 'x'){
                        
                            return -1;
                        }
                        
                            if ( p[0]  == 'o' &&
                                    p[4]  == 'o' &&
                                    p[8]  == 'o'){
                        
                            return -2;
                        }
                    }
                    else
                    if (p[0]  == p[3] &&
                                p[3]  == p[6])
                            {
                            
                                if ( p[0]  == 'x' &&
                                            p[3]  == 'x' &&
                                            p[6]  == 'x'){
                                
                                    return -1;
                                }
                                
                                    if ( p[0]  == 'o' &&
                                            p[3]  == 'o' &&
                                            p[6]  == 'o'){
                                
                                    return -2;
                                }
                            }
                            else
                            if (p[3]  == p[4] &&
                                        p[4]  == p[5])
                                    {
                                    
                                        if ( p[3]  == 'x' &&
                                                    p[4]  == 'x' &&
                                                    p[5]  == 'x'){
                                        
                                            return -1;
                                        }
                                        
                                            if ( p[3]  == 'o' &&
                                                    p[4]  == 'o' &&
                                                    p[5]  == 'o'){
                                        
                                            return -2;
                                        }
                                    }
                                    else
                                    if (p[6]  == p[7] &&
                                                p[7]  == p[8])
                                            {
                                            
                                                if ( p[6]  == 'x' &&
                                                            p[7]  == 'x' &&
                                                            p[8]  == 'x'){
                                                
                                                    return -1;
                                                }
                                                
                                                    if ( p[6]  == 'o' &&
                                                            p[7]  == 'o' &&
                                                            p[8]  == 'o'){
                                                
                                                    return -2;
                                                }
                                            }
                                            else
                                            if (p[1]  == p[4] &&
                                                        p[4]  == p[7])
                                                    {
                                                    
                                                        if ( p[1]  == 'x' &&
                                                                    p[4]  == 'x' &&
                                                                    p[7]  == 'x'){
                                                        
                                                            return -1;
                                                        }
                                                        
                                                            if ( p[1]  == 'o' &&
                                                                    p[4]  == 'o' &&
                                                                    p[7]  == 'o'){
                                                        
                                                            return -2;
                                                        }
                                                    }
                                                    else
                                                    if (p[2]  == p[5] &&
                                                                p[5]  == p[8])
                                                            {
                                                            
                                                                if ( p[2]  == 'x' &&
                                                                            p[5]  == 'x' &&
                                                                            p[8]  == 'x'){
                                                                
                                                                    return -1;
                                                                }
                                                                
                                                                    if ( p[2]  == 'o' &&
                                                                            p[5]  == 'o' &&
                                                                            p[8]  == 'o'){
                                                                
                                                                    return -2;
                                                                }
                                                            }
                                                            else
                                                            if ( p[2]  == p[4] &&
                                                                        p[4]  == p[6]){
                                                            
                                                                if ( p[2]  == 'x' &&
                                                                            p[4]  == 'x' &&
                                                                            p[6]  == 'x'){
                                                                
                                                                    return -1;
                                                                }
                                                                
                                                                    if ( p[2]  == 'o' &&
                                                                            p[4]  == 'o' &&
                                                                            p[6]  == 'o'){
                                                                
                                                                    return -2;
                                                                }
                                                            }
    
        return 0;
}
