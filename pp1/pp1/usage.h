#ifndef _H_usage
#define _H_usage

#include <stdlib.h>
#include <stdio.h>

void FailedKey(const char *format, ...);

#define Assert(expr)  \
  ((expr) ? (void)0 : Failure("Assertion failed: %s, line %d:\n    %s", __FILE__, __LINE__, #expr))

void PrintDebugKey(const char *key, const char *format, ...);

void SetDebugKey(const char *key, bool val);

bool IsDebugOn(const char *key);

void ParseArguments(int argc, char *argv[]);
     
#endif
