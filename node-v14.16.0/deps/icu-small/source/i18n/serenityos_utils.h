#ifndef _SIGNBIT_NATIVE_DEFINED_ALREADY_INCLUDED
#define _SIGNBIT_NATIVE_DEFINED_ALREADY_INCLUDED
#ifndef _SIGNBIT_NATIVE_DEFINED
bool ___signbit_(float n) { return (((n) < 0) ? 1 : 0); }
bool ___signbit_(double n) { return (((n) < 0) ? 1 : 0); }
bool ___signbit_(long double n) { return (((n) < 0) ? 1 : 0); }
bool ___isnan_(float n) { return (n != n); }
bool ___isnan_(double n) { return (n != n); }
bool ___isnan_(long double n) { return (n != n); }
bool ___isfinite_(float n) { return false; }
bool ___isfinite_(double n) { return false; }
bool ___isfinite_(long double n) { return false; }
#endif
#endif
