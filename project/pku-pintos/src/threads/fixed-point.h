#include <stdint.h>

#define FP_F (1 << 14)
typedef int32_t fp;

/** Convert integer n to fixed-point. */
fp int2fp (int32_t n);

/** Convert fixed-point x to integer (round toward zero). */
int32_t fp2int_round_down (fp x);

/** Convert fixed-point x to integer (round to nearest). */
int32_t fp2int_near (fp x);

/** Add two fixed-point numbers. */
fp fp_add (fp x, fp y);

/** Subtract fixed-point y from fixed-point x. */
fp fp_sub (fp x, fp y);

/** Add integer n to fixed-point x. */
fp fp_add_int (fp x, int32_t n);

/** Subtract integer n from fixed-point x. */
fp fp_sub_int (fp x, int32_t n);

/** Multiply two fixed-point numbers. */
fp fp_mul (fp x, fp y);

/** Multiply fixed-point x by integer n. */
fp fp_mul_int (fp x, int32_t n);

/** Divide fixed-point x by fixed-point y. */
fp fp_div (fp x, fp y);

/** Divide fixed-point x by integer n. */
fp fp_div_int (fp x, int32_t n);