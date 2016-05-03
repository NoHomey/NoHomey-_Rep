#include <iostream>
#include <cstdlib> 
using namespace std;

template <typename Tmp> class Vector {

	Tmp* data_;
	unsigned max_size_;
	unsigned current_size_;
	
	public:
		Vector () : max_size_ (1), current_size_ (0), data_ (new Tmp) {}
		
		Vector (int size) : max_size_ (size), current_size_ (0), data_ (new Tmp [size]) {}
		
		Vector (const Vector& to_be_copied)
		: max_size_ (to_be_copied.max_size_), current_size_ (to_be_copied.current_size_), data_ (new Tmp [to_be_copied.current_size_]) {
			for(int i = 0; i < current_size_; i++) data_[i] = to_be_copied.data_[i];
		}
		
		~Vector() { delete [] data_; }
		
		class Iterator {
			
			Tmp* position_;
			
			public:
				Iterator (Tmp* position) : position_ (position) {}
			
				Iterator operator ++ () { ++position_; return *this; }
				
				Iterator operator++(int) {
					Iterator post_it(position_);
					position_++;
					return post_it;
				}
				
				Iterator operator -- () { --position_; return *this; }
				
				Iterator operator --(int) {
					Iterator post_it(position_);
					position_--;
					return post_it;
				}
				
				Iterator operator += (unsigned n) { position_ += n; return *this; }
				
				Iterator operator -= (unsigned n) { position_ -= n; return *this; }
				
				bool operator == (const Iterator& other) const { return position_ == other.position_;}
				
				bool operator != (const Iterator& other) const { return position_ != other.position_;}
				
				Tmp& operator * () const { return *position_; }
				
				Tmp* operator -> () const { return position_; }		
		};
		
		class Reverse_Iterator {
			
			Tmp* position_;
		
			public:
				Reverse_Iterator (Tmp* position) : position_ (position) {}
			
				Reverse_Iterator operator ++ () { --position_; return *this; }
				
				Reverse_Iterator operator ++(int) {
					Reverse_Iterator post_it(position_);
					position_--;
					return post_it;
				}
				
				Reverse_Iterator operator -- () { ++position_; return *this; }
				
				Reverse_Iterator operator --(int) {
					Reverse_Iterator post_it(position_);
					position_++;
					return post_it;
				}
				
				Reverse_Iterator operator += (unsigned n) { position_-=n; return *this; }
				
				Reverse_Iterator operator -= (unsigned n) { position_+=n; return *this; }
				
				Iterator base () { return Iterator (position_ + 1); }	
				
				bool operator == (const Reverse_Iterator& other) const { return position_ == other.position_;}
				
				bool operator != (const Reverse_Iterator& other) const { return position_ != other.position_;}
				
				Tmp& operator * () const { return *position_; }
				
				Tmp* operator -> () const { return position_; }
		};
		
		class Const_Iterator {
			
			const Tmp* position_;
			
			public:
				Const_Iterator (Tmp* position) : position_ (position) {}
			
				Const_Iterator operator ++ () { ++position_; return *this; }
				
				Const_Iterator operator++(int) {
					Const_Iterator post_it(position_);
					position_++;
					return post_it;
				}
				
				Const_Iterator operator -- () { --position_; return *this; }
				
				Const_Iterator operator --(int) {
					Const_Iterator post_it(position_);
					position_--;
					return post_it;
				}
				
				Const_Iterator operator += (unsigned n) { position_ += n; return *this; }
				
				Const_Iterator operator -= (unsigned n) { position_ -= n; return *this; }
				
				Iterator mute ()  { return Iterator (position_); }	
				
				bool operator == (const Iterator& other) const { return position_ == other.position_;}
				
				bool operator != (const Iterator& other) const { return position_ != other.position_;}
				
				const Tmp& operator * () const { return *position_; }
				
				const Tmp* operator -> () const { return position_; }		
		};
		
		class Const_Reverse_Iterator {
			
			const Tmp* position_;
		
			public:
				Const_Reverse_Iterator (Tmp* position) : position_ (position) {}
			
				Const_Reverse_Iterator operator ++ () { --position_; return *this; }
				
				Const_Reverse_Iterator operator ++(int) {
					Const_Reverse_Iterator post_it(position_);
					position_--;
					return post_it;
				}
				
				Const_Reverse_Iterator operator -- () { ++position_; return *this; }
				
				Const_Reverse_Iterator operator --(int) {
					Const_Reverse_Iterator post_it(position_);
					position_++;
					return post_it;
				}
				
				Const_Reverse_Iterator operator += (unsigned n) { position_-=n; return *this; }
				
				Const_Reverse_Iterator operator -= (unsigned n) { position_+=n; return *this; }
				
				Iterator base_mute () { return Iterator (position_ + 1); }	
				
				bool operator == (const Reverse_Iterator& other) const { return position_ == other.position_;}
				
				bool operator != (const Reverse_Iterator& other) const { return position_ != other.position_;}
				
				const Tmp& operator * () const { return *position_; }
				
				const Tmp* operator -> () const { return position_; }
		};
		
		unsigned size () const { return current_size_; }
		
		bool empty () const { return current_size_ == 0; }
		
		unsigned capacity () const { return max_size_; }
		
		unsigned max_size () const { return max_size_; }
		
		Tmp& operator [] (unsigned n) { if (n < current_size_) return data_[n]; }
		
		const Tmp& operator [] (unsigned n) const { if (n < current_size_) return data_[n]; }
		
		Vector& operator = (const Vector& to_be_copied) {
			if (*this != &to_be_copied) {
				delete [] data_;
				current_size_ = to_be_copied.current_size_;
				data_ = new Tmp [current_size_];
			}
			for(int i = 0; i < current_size_; i++) data_[i] = to_be_copied.data_[i]; return *this;
		}
		
		void clear () { current_size_ = 0; delete [] data_; data_ = new Tmp; }
		
		Iterator begin() { return Iterator (data_); }
		
		Iterator end() { return Iterator (data_ + current_size_); }
		
		Reverse_Iterator rbegin() { return Reverse_Iterator (data_ + (current_size_ - 1)); }
		
		Reverse_Iterator rend() { return Reverse_Iterator (data_ - 1); }
		
		Const_Iterator begin() const { return Const_Iterator (data_); }
		
		Const_Iterator end() const { return Const_Iterator (data_ + current_size_); }
		
		Const_Reverse_Iterator rbegin() const { return Const_Reverse_Iterator (data_ + (current_size_ - 1)); }
		
		Const_Reverse_Iterator rend() const { return Const_Reverse_Iterator (data_ - 1); }
		
		Tmp& front () { return data_ [0]; }
		
		const Tmp& front () const { return data_ [0]; }
		
		Tmp& back() { return data_ [current_size_ - 1]; }
		
		const Tmp& back () const { return data_ [current_size_ - 1]; }
		
		Tmp& at (unsigned n) { if (n < current_size_) return data_ [n]; }
		
		const Tmp& at (unsigned n) const { if (n < current_size_) return data_ [n]; }
		
		Tmp& element (unsigned n) { if ((n - 1) < current_size_) return data_ [n - 1]; }
		
		const Tmp& element (unsigned n) const { if ((n - 1) < current_size_) return data_ [n - 1]; }
		
		Tmp& first () { front(); }
		
		const Tmp& first () const { front(); }
		
		Tmp& last () { back(); }
		
		const Tmp& last () const { back(); }
		
		Vector& reserve () {
			Tmp* old_data= data_;
			++max_size_;
			data_ = new Tmp [max_size_];
			for(int i=0; i< current_size_; ++i) data_[i] = old_data[i];
			delete [] old_data;
			return *this;
		}
		
		Vector& reserve (unsigned n) {
			Tmp* old_data= data_;
			max_size_ = n;
			data_ = new Tmp [max_size_];
			for(int i=0; i< current_size_; ++i) data_[i] = old_data[i];
			delete [] old_data;
			return *this;
		}
	
		void push_back (const Tmp& element) {
			if (current_size_ == max_size_) reserve();
			data_[current_size_++] = element;
		}
		
		void pop_back () { if (!empty()) current_size_--; }
		
		Tmp* data () { return data_; }
		
		const Tmp* data () const { return data_; }
		
		void print (char* name) const {
			cout << name << ": {";
			for(int i = 0; i < current_size_; i++) cout << data_[i] << ", ";
			cout << "}" << endl;
		}
		
		Iterator insert (Iterator position, const Tmp& element) {
			if(max_size_ == current_size_) max_size_++; 
			Tmp* old_data = data_;
			data_ = new Tmp [max_size_];
			int i;
			for (i = 0; &old_data[i] != &*position; i++) data_[i] = old_data[i];
			data_[i] = element;
			Iterator res(data_ + i);
			for(i; i < current_size_; i++) data_[i + 1] = old_data[i];
			current_size_++;
			delete [] old_data;
			return res;
		}
		
		Iterator erase (Iterator position) {
			Tmp* old_data = data_;
			max_size_ = current_size_;
			data_ = new Tmp [max_size_];
			int i;
			current_size_--;
			for (i = 0; &old_data[i] != &*position; i++) data_[i] = old_data[i];
			if (current_size_ == i) {
				delete [] old_data;
				return Iterator (data_ + i);
			}
			data_[i] = old_data[i + 1];
			Iterator res (data_ + i);
			for(i = i + 1; i< current_size_ + 1;i++) data_[i] = old_data[i + 1];
			delete [] old_data;
			return res;
        	}
        	
        	Iterator erase (Iterator position , Iterator last) {
			Tmp* old_data = data_;
			Tmp data [current_size_];
			Tmp sec [current_size_];
			int i, c, j, k;
			for (i = 0; &old_data[i] != &*position; i++) data[i] = old_data[i];
			for (c = 0, j = current_size_ - 1; &old_data[j + 1] != &*last; j--, c++ ) sec [c] = old_data[j];
			if (c != 0) {	
				Tmp arr[c];
				for(c = c - 1, j = 0; c >= 0; c--, j++ ) arr[j] = sec[c];
				for(k = 0, i = i; k < j; k++, i++ ) { data[i] = arr[k]; if (k == 0) c = i; }
			} else c = i;
			current_size_ = i;
			delete [] old_data;
			max_size_ = current_size_;
			data_ = new Tmp [max_size_];
			for(k = 0; k < current_size_; k++) data_[k] = data[k];
			return Iterator (data_ + c);
        	}
};

int main (int argc, char *argv[]) {
	Vector<int> v1;
	Vector<int> v2;
	for(int i = atoi(argv[1]); i < atoi(argv[2]); i++) v1.push_back(i); 
	for(int i = atoi(argv[3]); i < atoi(argv[4]); i++) v2.push_back(i); 
	v1.print("v1");
	v2.print("v2");
	int k = 0;
	for (Vector<int>::Iterator b1 = v1.begin(); b1 != v1.end(); b1++) for (Vector<int>::Iterator b2 = v2.begin(); b2 != v2.end(); b2++) if(*b1 == *b2) k++;
	cout << "equal element in v1 and v2: " << k << endl;	
	v1.push_back(-100);
	v2.push_back(-100);	
	v1.print("v1");
	v2.print("v2");
	Vector<int> v (v2);
	v.print("v");
	v.print("v");
	Vector<int>::Iterator it = v.begin();
	for (Vector<int>::Reverse_Iterator b1 = v1.rbegin(); b1 != v1.rend(); b1++) it = v.insert(it, *b1);
	v.print("v");
	for (it = v.begin(); it != v.end(); it++) if (*it == -100) break;
	v.erase(v.insert(v.erase(it, v.end()), -1));
	v.print("v");
	return 0;
}
