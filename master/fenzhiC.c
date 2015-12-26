#include <math.h>
#include "mex.h"

void extract(double *x, int xpos, int ypos, double *xx,int len)
{
    int i=0,j=0;
    
     for(i=0;i<len/2;i++)
     {
       for(j=0;j<len/2;j++)
       {
           xx[i + j*len/2] = x[i+(xpos-1)*len/2 + (j+(ypos-1)*len/2)*len ];
       }
     }  
    
}

void joint(double *x11, double *x12, double *x21, double *x22, double *xx, int len)
{
    int i=0,j=0;
    
     for(i=0;i<len;i++)
     {
       for(j=0;j<len;j++)
       {
           xx[i + j*len*2] = x11[i + j*len];
       }
     } 
    
     for(i=0;i<len;i++)
     {
       for(j=len;j<len*2;j++)
       {
           xx[i + j*len*2] = x12[i + (j-len)*len];
       }
     } 
    
     for(i=len;i<len*2;i++)
     {
       for(j=0;j<len;j++)
       {
           xx[i + j*len*2] = x21[i-len + j*len];
       }
     } 
    
     for(i=len;i<len*2;i++)
     {
       for(j=len;j<len*2;j++)
       {
           xx[i + j*len*2] = x22[i-len +(j-len)*len];
       }
     } 
    
}

void operation(double *a, char op, double *b, double *c,int len)
{
    int i=0,j=0;
    
    for(i=0;i<len;i++)
    {
        for(j=0;j<len;j++)
        {
            if(op == '+')
            {
                c[i + j*len] = a[i + j*len] + b[i + j*len];
            }
            else
            {
                c[i + j*len] = a[i + j*len] - b[i + j*len];
            }
        }
    }
    
}

void fenzhiC(double *a, double *b, double *c, int len)
{
    double *c11,*c12,*c21,*c22;
    double *a11,*a12,*a21,*a22,*b11,*b12,*b21,*b22;
    double *t1,*t2,*t3,*t4,*t5,*t6,*t7,*t8;
    
    c11 = mxCalloc(len*len/4,sizeof(double));
    c12 = mxCalloc(len*len/4,sizeof(double));
    c21 = mxCalloc(len*len/4,sizeof(double));
    c22 = mxCalloc(len*len/4,sizeof(double));
 
    a11 = mxCalloc(len*len/4,sizeof(double));
    a12 = mxCalloc(len*len/4,sizeof(double));
    a21 = mxCalloc(len*len/4,sizeof(double));
    a22 = mxCalloc(len*len/4,sizeof(double));
    b11 = mxCalloc(len*len/4,sizeof(double));
    b12 = mxCalloc(len*len/4,sizeof(double));
    b21 = mxCalloc(len*len/4,sizeof(double));
    b22 = mxCalloc(len*len/4,sizeof(double));
    
    t1 = mxCalloc(len*len/4,sizeof(double));
    t2 = mxCalloc(len*len/4,sizeof(double));
    t3 = mxCalloc(len*len/4,sizeof(double));
    t4 = mxCalloc(len*len/4,sizeof(double));
    t5 = mxCalloc(len*len/4,sizeof(double));
    t6 = mxCalloc(len*len/4,sizeof(double));
    t7 = mxCalloc(len*len/4,sizeof(double));
    t8 = mxCalloc(len*len/4,sizeof(double));
    
    
    if( len == 2 )
    {
        *c11 = a[0] * b[0] + a[2] * b[1];
        *c12 = a[0] * b[2] + a[2] * b[3];
        *c21 = a[1] * b[0] + a[3] * b[1];
        *c22 = a[1] * b[2] + a[3] * b[3];
    }
    else
    {
        extract(a,1,1,a11,len);extract(a,1,2,a12,len);extract(a,2,1,a21,len);extract(a,2,2,a22,len);
        extract(b,1,1,b11,len);extract(b,1,2,b12,len);extract(b,2,1,b21,len);extract(b,2,2,b22,len);
        
        fenzhiC( a11, b11, t1, len/2 ); fenzhiC( a12, b21, t2,len/2 ); fenzhiC( a11, b12, t3,len/2 );fenzhiC( a12, b22, t4,len/2 );
        fenzhiC( a21, b11, t5, len/2 ); fenzhiC( a22, b21, t6,len/2 ); fenzhiC( a21, b12, t7,len/2 );fenzhiC( a22, b22, t8,len/2 );
        operation( t1, '+', t2, c11, len/2) ;
        operation( t3, '+', t4, c12, len/2) ;
        operation( t5, '+', t6, c21, len/2) ;
        operation( t7, '+', t8, c22, len/2) ;
    }
    joint(c11,c12,c21,c22,c,len/2);
    
    mxFree(t1);mxFree(t2);mxFree(t3);mxFree(t4);mxFree(t5);mxFree(t6);mxFree(t7);mxFree(t8);
    mxFree(a11);mxFree(a12);mxFree(a21);mxFree(a22);mxFree(b11);mxFree(b12);mxFree(b21);mxFree(b22);
    mxFree(c11);mxFree(c12);mxFree(c21);mxFree(c22);
}



void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *a,*b;
    int m=0,n=0;
    
    a = mxGetPr(prhs[0]);
    b = mxGetPr(prhs[1]);
    m = mxGetM(prhs[0]);
    n = mxGetN(prhs[0]);
    plhs[0] = mxCreateNumericMatrix(m,n,mxDOUBLE_CLASS,mxREAL);
    
    double *c;
    
    c = mxGetPr(plhs[0]);
    fenzhiC(a,b,c,m);
}