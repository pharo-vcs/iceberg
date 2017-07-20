testing
< aMagnitude 
	"Answer whether the receiver is less than the argument."
	| version |
	version := aMagnitude iceSemanticVersion.
	^ self major < version major
		or: [ self minor < version minor 
		or: [ self patch < version patch ] ]