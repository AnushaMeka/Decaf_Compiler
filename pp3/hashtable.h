#ifndef _H_hashtable
#define _H_hashtable

#include <map>
#include <string.h>
using namespace std;
    
struct ltstr {
  bool operator()(const char* s1, const char* s2) const
  { return strcmp(s1, s2) < 0; }
};


template <class Value> class Iterator; 
 
template<class Value> class Hashtable {

  private: 
     multimap<const char*, Value, ltstr> mmap;
 
   public:
            // ctor creates a new empty hashtable
     Hashtable() {}

           // Returns number of entries currently in table
     int NumEntries() const;

           // Associates value with key. If a previous entry for
           // key exists, the bool parameter controls whether 
           // new value overwrites the previous (removing it from
           // from the table entirely) or just shadows it (keeps previous
           // and adds additional entry). The lastmost entered one for an
           // key will be the one returned by Lookup.
     void Enter(const char *key, Value value,
		    bool overwriteInsteadOfShadow = true);

           // Removes a given key->value pair.  Any other values
           // for that key are not affected. If this is the last
           // remaining value for that key, the key is removed
           // entirely.
     void Remove(const char *key, Value value);

          // Returns value stored under key or NULL if no match.
          // If more than one value for key (ie shadow feature was
          // used during Enter), returns the lastmost entered one.
     Value Lookup(const char *key);

          // Returns an Iterator object (see below) that can be used to
          // visit each value in the table in alphabetical order.
     Iterator<Value> GetIterator();

};


template <class Value> 
class Iterator {

  friend class Hashtable<Value>;

  private:
    typename multimap<const char*, Value , ltstr>::iterator cur, end;
    Iterator(multimap<const char*, Value, ltstr>& t)
	: cur(t.begin()), end(t.end()) {}
	 
  public:
    Value GetNextValue();
};


#include "hashtable.cc" // icky, but allows implicit template instantiation

#endif

