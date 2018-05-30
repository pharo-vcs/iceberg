tests
testCanHandleComplexDomainNonGitUrl
	| url |
	self assert: (IceGitSshRemote canHandleUrl: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git').
	url := IceGitSshRemote new
				url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git';
				parseUrl.
	self assert: url projectName equals: 'rdebug'.
	self assert: url path equals: OrderedCollection new.