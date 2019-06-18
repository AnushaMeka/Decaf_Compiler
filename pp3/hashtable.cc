template <class Value> 
void Hashtable<Value>::Enter(const char *key, Value val, bool overwrite)
{
  Value prev;
  if (overwrite && (prev = Lookup(key)))
    Remove(key, prev);
  mmap.insert(make_pair(strdup(key), val));
}

 
template <class Value> void Hashtable<Value>::Remove(const char *key, Value val)
{
  if (mmap.count(key) == 0) // no matches at all
    return;

  typename multimap<const char *, Value>::iterator itr;
  itr = mmap.find(key); // start at first occurrence
  while (itr != mmap.upper_bound(key)) {
    if (itr->second == val) { // iterate to find matching pair
	mmap.erase(itr);
	break;
    }
    ++itr;
  }
} 

template <class Value> 
Value Hashtable<Value>::Lookup(const char *key) 
{
  Value found = NULL;
  
  if (mmap.count(key) > 0) {
    typename multimap<const char *, Value>::iterator cur, last, prev;
    cur = mmap.find(key); // start at first occurrence
    last = mmap.upper_bound(key);
    while (cur != last) { // iterate to find last entered
	prev = cur; 
	if (++cur == mmap.upper_bound(key)) { // have to go one too far
	  found = prev->second; // one before last was it
	  break;
	}
    }
  }
  return found;
}


template <class Value> 
int Hashtable<Value>::NumEntries() const
{
  return mmap.size();
}


template <class Value> 
Iterator<Value> Hashtable<Value>::GetIterator() 
{
  return Iterator<Value>(mmap);
}


template <class Value> 
Value Iterator<Value>::GetNextValue()
{
  return (cur == end ? NULL : (*cur++).second);
}


