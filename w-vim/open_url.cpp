// include files {{{1
#include <bits/stdc++.h>

// Main function {{{1
int main(int argv , const char **argc) {
	if(argv != 2) {
		return 1;
	}
	std::string s = argc[1];
	unsigned int pos = s.find("https");
	if(pos >= s.size())
		pos = s.find("http");
	if(pos >= s.size()) {
		return 1;
	}
	system(("firefox "+s.substr(pos , s.size())).c_str());
}
