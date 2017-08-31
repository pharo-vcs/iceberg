converting
asInteger
	"this does not works for versions 0.100+.*, but I do not think it will arrive to that"
	^ (self major * 10000) 
		+ (self minor * 100)
		+ self patch