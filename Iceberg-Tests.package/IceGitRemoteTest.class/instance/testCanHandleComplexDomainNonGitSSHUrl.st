tests
testCanHandleComplexDomainNonGitSSHUrl
	| url |
	self assert: (IceGitScpRemote canHandleUrl: 'ssh://git@git.fremont.lamrc.net/diffuse/300/rdebug.git').
	url := IceGitScpRemote new
				url: 'ssh://git@git.fremont.lamrc.net/diffuse/300/rdebug.git';
				parseUrl.
	self assert: url projectName equals: 'rdebug'.
	self assert: url path equals: OrderedCollection new.