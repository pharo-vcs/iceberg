private
command: aCommandDescription
	"See IceGitCommand for the specification of possible command descriptions"
	^ IceGitCommand 
		in: self localRepository 
		execute: aCommandDescription
