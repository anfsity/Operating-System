#include "fixed-point.h"

fp int2fp (int32_t n)
{
  return n * FP_F;
}

int32_t fp2int_round_down (fp x)
{
  return x / FP_F;
}

int32_t fp2int_near (fp x)
{
  if (x >= 0)
    {
      return (x + FP_F / 2) / FP_F;
    }
  else
    {
      return (x - FP_F / 2) / FP_F;
    }
}

fp fp_add (fp x, fp y)
{
  return x + y;
}

fp fp_sub (fp x, fp y)
{
  return x - y;
}

fp fp_add_int (fp x, int32_t n)
{
  return x + int2fp (n);
}

fp fp_sub_int (fp x, int32_t n)
{
  return x - int2fp (n);
}

fp fp_mul (fp x, fp y)
{
  return (int64_t) (x) *y / FP_F;
}

fp fp_mul_int (fp x, int32_t n)
{
  return x * n;
}

fp fp_div (fp x, fp y)
{
  return (int64_t) (x) *FP_F / y;
}

fp fp_div_int (fp x, int32_t n)
{
  return x / n;
}