accessing
guessRegisteredRepository
	"I get the project name and try to find it into the already registered projects. 
	 If I find it, I will use this instead cloning a new one."

	^ IceRepository registry 
		detect: [ : each | each name = self projectName ] 
		ifNone: [ nil ]