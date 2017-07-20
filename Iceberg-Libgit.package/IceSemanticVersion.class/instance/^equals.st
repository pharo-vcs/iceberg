testing
= aMagnitude 
	"Compare the receiver with the argument and answer with true if the 
	receiver is equal to the argument. Otherwise answer false."
	| version |
	
	version := aMagnitude iceSemanticVersion.
	^ self major = version major 
		and: [ self minor = version minor
		and: [ self patch = version patch ] ] 