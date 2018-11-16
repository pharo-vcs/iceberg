API-remotes
pullFrom: aRemote
	"Fetch new commits corresponding to the remote.
	Then merge the remote branch with the current branch."
	self branch pullFrom: aRemote