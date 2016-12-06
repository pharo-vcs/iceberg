accessing
shortName
	"If I am a remote tracking branch sudh as refs/remotes/origin/master, just return the more familiar name origin/master (and if not return my name)"
	^ self name withoutPrefix: 'refs/remotes/'
