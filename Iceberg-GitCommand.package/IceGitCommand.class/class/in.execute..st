execute
in: directory execute: commandDescription
	"See class comments for the specification of possible command descriptions"
	^ self new 
		directory: directory;
		command: (self preprocess: commandDescription);
		run
