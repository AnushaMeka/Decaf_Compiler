#ifndef _error_h_
#define _error_h_

#include <string>
#include "locLine.h"
using namespace std;

class NotifyError {
 public:

  static void NonterminalComment(); 
  static void LongIdentifier(yyltype *loc, const char *ident);
  static void NonterminalString(yyltype *loc, const char *str);
  static void UnrecognizedChar(yyltype *loc, char ch);

  static void Formatted(yyltype *loc, const char *format, ...);


  static int NumErrors() { return numErrors; }
  
 private:
  static void UnderlineErrorInLine(const char *line, yyltype *pos);
  static void OutputError(yyltype *loc, string msg);
  static int numErrors;
};
#endif
