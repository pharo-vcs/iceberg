testing
isAlternateSSHUrl: aUrl
	"Definition taken from https://stackoverflow.com/questions/14348874/git-repository-url-ssh-syntax-without-absolute-path"
	^ (aUrl includesSubstring: '://') not and: [ (aUrl beginsWith: '/') not ]