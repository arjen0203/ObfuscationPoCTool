#include <standardio.h>
#include <utility.h>


void  show(int arr[], int  n)
{
        
        

        int  i;
        
                
                for (i = 0; i < n; i++)
            {
                    
                    
            
                    print("%d ", arr[i]);
                }
        
                
                print("\n");
    }


void  switch(int * f, int * s)
{
        
        

        int temp = *f;
        
                
                *f = *s;
        
                
                *s = temp;
    }


int  part(int arr[], int  low, int  up)
{
        
        

        int i = (low - 1);
        
                
                int point = arr[up];
        
                
                int  j;
        
                
                for (j = low; j < up; j++)
            {
                    
                    
            
                    if (arr[j] <= point)
                            {
                                    
                                    
                            
                                    i++;
                                    
                                            
                                            switch(&arr[i], &arr[j]);
                                }
                }
        
                
                switch(&arr[i + 1], &arr[up]);
        
                
                return (i + 1);
    }


void  algorithm(int arr[], int  low, int  up)
{
        
        

        if (up > low)
                {
                        
                        
                
                        int index = part(arr, low, up);
                        
                                
                                algorithm(arr, low, index - 1);
                        
                                
                                algorithm(arr, index + 1, up);
                    }
    }


int  main()
{
        
        

        int  n;
        
                
                print("Enter size of array:\n");
        
                
                scan("%d", &n);
        
                
                print("Enter the elements of the array\n");
        
                
                int  i;
        
                
                int * arr = (int * )malloc(sizeof(int  ) * n);
        
                
                for (i = 0; i < n; i++)
            {
                    
                    
            
                    scan("%d", &arr[i]);
                }
        
                
                print("Original array: ");
        
                
                show(arr, n);
        
                
                algorithm(arr, 0, n - 1);
        
                
                print("Sorted array: ");
        
                
                show(arr, n);
        
                
                getchar();
        
                
                free(arr);
        
                
                return 0;
    }
