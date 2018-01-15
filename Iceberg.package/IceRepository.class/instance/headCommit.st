API-accessing
headCommit
	"The head can be either a branch or a commit. To access the current commit you can ask the head for its commit, or directly the repository for its headCommit (Yes, commits and branches are polymorphic, a commit returns self when asked for its commit)."

	^ self head commit