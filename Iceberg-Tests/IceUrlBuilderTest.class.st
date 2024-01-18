Class {
	#name : 'IceUrlBuilderTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'tests' }
IceUrlBuilderTest >> testArbitraryHttpsUrl [

	| url |
	url := IceUrlBuilder new
		beHttps;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'https://localhost/repo.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testArbitrarySSHUrl [

	| url |
	url := IceUrlBuilder new
		beSsh;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'git@localhost:repo.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testBitbucketHttpsUrl [

	| url |
	url := IceUrlBuilder new
		beHttps;
		beBitbucket;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://bitbucket.org/username/project.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testBitbucketSSHUrl [

	| url |
	url := IceUrlBuilder new
		beSsh;
		beBitbucket;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@bitbucket.org:username/project.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testExplicitHttpsProtocolUrl [

	| url |
	url := IceUrlBuilder new
		protocol: IceHttpsProtocol new;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'https://localhost/repo.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testExplicitSSHProtocolUrl [

	| url |
	url := IceUrlBuilder new
		protocol: IceSSHProtocol new;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'git@localhost:repo.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testGitHubHttpsUrl [

	| url |
	url := IceUrlBuilder new
		beHttps;
		beGithub;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://github.com/username/project.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testGitHubSSHUrl [

	| url |
	url := IceUrlBuilder new
		beSsh;
		beGithub;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@github.com:username/project.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testGitLabHttpsUrl [

	| url |
	url := IceUrlBuilder new
		beHttps;
		beGitLab;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://gitlab.com/username/project.git'
]

{ #category : 'tests' }
IceUrlBuilderTest >> testGitLabSSHUrl [

	| url |
	url := IceUrlBuilder new
		beSsh;
		beGitLab;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@gitlab.com:username/project.git'
]
