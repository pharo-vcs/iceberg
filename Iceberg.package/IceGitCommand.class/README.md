I allow to execute git command. I am not intended to be instantiated, just do:  `IceGitCommand in: aDirectory execute: aCommandDescription`

A command description can be 
1. A string with a git command line, for example:
 ÃÂ ÃÂ ÃÂ
IceGitCommand in: aDirectory execute: 'checkout master'
 ÃÂ ÃÂ ÃÂ
Will have the same efect as going with the command line to the same directory and execute `git checkout master`.

2. A collection of arguments. For example the same previous efect can be achieved using:
 ÃÂ ÃÂ ÃÂ
IceGitCommand in: aDirectory execute: {'checkout'. 'master'}
 ÃÂ ÃÂ ÃÂ

Moreover, the command description can contain:
- strings (that are transferred to git without modifications.
- other collections (the command description will be flattened).
- nil (that will be ignored)

The latter is useful for simplifying the specification of optional parameters, for example:

 ÃÂ ÃÂ ÃÂ
	self in: self location parent executeCommand: 
		{'clone'.
		branch notNil ifTrue: {'-b'. branch}.
		readonly ifTrue: {'--depth'. '1'}.
		remoteUrl.
		location basename}
 ÃÂ ÃÂ ÃÂ

