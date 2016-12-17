auxiliar
gitCommand: aCommandDescription
	"Do not delegate to repository because not all repositories support this message.
	See IceGitCommand for the specification of possible command descriptions"
	^ [ 
		IceGitCommand 
			in: repository location  
			execute: aCommandDescription. 
	] 
	ensure: [ repository refresh ]
