comparing
hash
	^ ((self species hash
		bitXor: self major)
		bitXor: self minor)
		bitXor: self patch
