private-initialization
init
	
	"Initialize new repository. This is the equivalent to running in the command line:
	  $ git init
	"
	(LGitRepository on: self location) init