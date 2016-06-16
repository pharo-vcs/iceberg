repository handling
command: aCommandDescription
	"See IceGitCommand for the specification of possible command descriptions"
	self ensureLocalRepository.
	self refresh.
	^ IceGitCommand in: self location execute: aCommandDescription
