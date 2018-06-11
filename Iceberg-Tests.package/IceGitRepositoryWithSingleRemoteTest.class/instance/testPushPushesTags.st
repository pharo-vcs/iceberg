running
testPushPushesTags

	"We can only push if the repository is bare"
	(self remoteRepository location / '.git') moveTo: self remoteRepository location , 'git'.
	self remoteRepository location ensureDeleteAll.
	(self remoteRepository location , 'git') moveTo: self remoteRepository location.
	IceGitCommand in: self remoteRepository location execute: { 'config'. '--bool'. 'core.bare'. 'true' }.
	fixture ensureRemoteRepository.
	
	super testPushPushesTags