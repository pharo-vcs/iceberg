Class {
	#name : 'IceGitRemoteTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'tests-scp' }
IceGitRemoteTest >> testCanHandleGithubImplicitScpUrl [

	self assert: (IceGitScpRemote canHandleUrl: 'git@github.com:npasserini/iceberg.git')
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testCanHandleGithubSSHUrl [

	self assert: (IceGitSshRemote canHandleUrl: 'git://github.com/pharo-vcs/iceberg.git')
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testCanHandleGithubSSHUrlWithExplicitPort [
	self assert: (IceGitSshRemote canHandleUrl: 'git://github.com:8372/pharo-vcs/iceberg').
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testCanHandleGithubScpUrl [

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://git@github.com/npasserini/iceberg.git').
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testCanHandleNonGithubImplicitScpUrl [

	self assert: (IceGitScpRemote canHandleUrl: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git')
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testCanHandleNonGithubSSHUrl [

	self assert: (IceGitSshRemote canHandleUrl: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git').
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testCanHandleNonGithubScpUrl [

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://git@git.fremont.lamrc.net/diffuse/300/rdebug.git').
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlExtractsFullUrlPath [
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlExtractsOwner [
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlExtractsPath [
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url path equals: #(  )
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlExtractsProjectName [
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlHasDefaultPort [
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url port equals: 22
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubImplicitScpUrlShouldBeTransformableToHttps [

	| remote |
	remote := IceGitScpRemote new url: 'git@github.com:npasserini/iceberg.git'.
	self assert: remote httpsUrl equals: 'https://github.com/npasserini/iceberg.git'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlExtractsFullUrlPath [
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlExtractsOwner [
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlExtractsPath [
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url path equals: OrderedCollection new
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlExtractsPort [
	| url |
	url := IceGitSshRemote new url: 'git://github.com:8372/pharo-vcs/iceberg.git'.
	self assert: url port equals: 8372
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlExtractsProjectName [
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlHasDefaultPort [
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url port equals: 9418
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testGithubSSHUrlShouldBeTransformableToHttps [
	| url |
	
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url httpsUrl equals: 'https://github.com/pharo-vcs/iceberg.git'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlExtractsFullUrlPath [
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlExtractsOwner [
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlExtractsPath [
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url path asArray equals: #(  )
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlExtractsProjectName [
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlHasDefaultPort [
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url port equals: 22
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testGithubScpUrlShouldBeTransformableToHttps [

	| remote |
	remote := IceGitScpRemote new url: 'ssh://git@github.com/npasserini/iceberg.git'.
	self assert: remote httpsUrl equals: 'https://github.com/npasserini/iceberg.git'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testHTTPSRemoteEqualsLocationThanSCPRemote [
	| sshremote scpremote |
	sshremote := IceGitHttpsRemote new url: 'https://github.com/pharo-vcs/iceberg.git'.
	scpremote := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: (sshremote referencesSameRemoteLocationAs: scpremote).
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testHTTPSRemoteNotEqualsLocationThanSCPRemote [
	| sshremote scpremote |
	sshremote := IceGitHttpsRemote new url: 'https://github.com/pharo-vcs/iceberg.git'.
	scpremote := IceGitScpRemote new url: 'git@github.com:different/iceberg.git'.
	self deny: (sshremote referencesSameRemoteLocationAs: scpremote).
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlExtractsFullUrlPath [
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url projectPath equals: 'diffuse/300/rdebug'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlExtractsOwner [
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url owner equals: '300'.
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlExtractsPath [
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url path equals: #( diffuse )
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlExtractsProjectName [
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url projectName equals: 'rdebug'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlHasDefaultPort [
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url port equals: 22
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubImplicitScpUrlShouldBeTransformableToHttps [
	| url |
	
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url httpsUrl equals: 'https://git.fremont.lamrc.net/diffuse/300/rdebug.git'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlExtractsFullUrlPath [
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url projectPath equals: 'diffuse/300/rdebug'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlExtractsOwner [
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url owner equals: '300'.
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlExtractsPath [
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url path asArray equals: #( diffuse )
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlExtractsPort [
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net:8372/diffuse/300/rdebug.git'.
	self assert: url port equals: 8372
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlHasDefaultPort [
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url port equals: 9418
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testNonGithubSSHUrlShouldBeTransformableToHttps [
	| url |
	
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url httpsUrl equals: 'https://git.fremont.lamrc.net/diffuse/300/rdebug.git'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlExtractsFullUrlPath [
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url projectPath equals: 'diffuse/300/rdebug'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlExtractsOwner [
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url owner equals: '300'.
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlExtractsPath [
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url path asArray equals: #( diffuse )
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlExtractsProjectName [
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url projectName equals: 'rdebug'
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlHasDefaultPort [
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url port equals: 22
]

{ #category : 'tests-scp' }
IceGitRemoteTest >> testNonGithubScpUrlShouldBeTransformableToHttps [
	| url |
	
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url httpsUrl equals: 'https://git.fremont.lamrc.net/diffuse/300/rdebug.git'
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testSSHRemoteEqualsLocationThanSCPRemote [
	| sshremote scpremote |
	sshremote := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	scpremote := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: (sshremote referencesSameRemoteLocationAs: scpremote).
]

{ #category : 'tests-ssh' }
IceGitRemoteTest >> testSSHRemoteNotEqualsLocationThanSCPRemote [
	| sshremote scpremote |
	sshremote := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	scpremote := IceGitScpRemote new url: 'git@github.com:different/iceberg.git'.
	self deny: (sshremote referencesSameRemoteLocationAs: scpremote).
]
