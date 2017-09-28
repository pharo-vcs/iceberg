comparing
< aMagnitude 
	"Answer whether the receiver is less than the argument."
	| version |
	version := aMagnitude iceSemanticVersion.
	^ self asInteger < version asInteger
