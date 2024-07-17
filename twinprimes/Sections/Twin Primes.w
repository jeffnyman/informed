@h The Conjecture.
The twin prime problem is a fascinating and enduring question in number theory. It asks whether there are infinitely many pairs of prime numbers that differ by 2. For example, (3, 5), (5, 7), (11, 13), and (17, 19) are twin prime pairs. The conjecture is that there are infinitely many such pairs.

Despite centuries of effort, this problem remains unsolved. While there has been significant progress in recent years, such as Yitang Zhang's groundbreaking work in 2013, a complete proof is still elusive. Twins are known to exist at least as far out as $10^{388,342}$, at least as of 2016. There are infinitely many pairs closer together than about 250.

The goal of this program is to find a few small pairs of twins, by the simplest method possible, and provide output regarding the findings.

= (text)
  3 and 5
  5 and 7
  11 and 13
  ...
=

@d RANGE 100 /* upper limit of range to consider */

=
#include <stdio.h>

int main(int argc, char *argv[]) {
  for (int i=1; i<RANGE; i++) {
    @<Test for twin prime at i@>;
  }

  return 0;
}

@<Test for twin prime at i@> =
  if ((isprime(i)) && (isprime(i+2))) {
    printf("%d and %d\n", i, i+2);
  }

@h Primality.
The isprime function checks if a number is prime by dividing it by all integers from 2 up to the square root of the number. If none of these divisions result in a remainder of 0, the number is prime.

@d TRUE 1
@d FALSE 0

=
int isprime(int n) {
  if (n <= 1) {
    return FALSE;
  }

  for (int m=2; m*m <= n; m++) {
    if (n % m == 0) {
      return FALSE;
    }
  }

  return TRUE;
}
=

@ A common error with this algorithm is to mistakenly check the condition where $m^2 < n$ rather than $m^2 \leq n$. This would wrongly consider certain numbers to be prime. For example, consider that the square root of 4 is 2. Using $m^2 < n$, we would only check divisibility by 2. Since 4 is divisible by 2, it would be incorrectly marked as prime.

Cambridge folklore has it that this very bug occurred with the first computation of the EDSAC computer on 6 May 1949.

While this code is a correct implementation for finding twin primes, there are some optimizations that could be considered:

(*) Odd Number Check: Since all primes greater than 2 are odd, it's possible to increment i by 2 instead of 1 to improve efficiency.
(*) Early Termination: If a number is divisible by a number less than or equal to its square root, it's composite. Then it's possible to terminate the prime check early in that case.

An optimized version incorporating those points might be this:

= (text as C)
bool isprime(int n) {
  if (n <= 1) return false;
  if (n <= 3) return true;
  if (n % 2 == 0 || n % 3 == 0) return false;

  for (int i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0)
      return false;
  }

  return true;
}
=

This code optimizes the prime checking by quickly handling small cases (numbers less than or equal to 3), checking divisibility by 2 and 3 at the start, iterating over numbers of the form $6k \pm 1$, as all primes greater than 3 are of this form, and, finally, using early termination if a divisor is found.
