Class {
	#name : #IceGitWithoutUserNameTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'username',
		'email'
	],
	#category : #'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitWithoutUserNameTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : #running }
IceGitWithoutUserNameTest >> setUp [

	| global |
	super setUp.
	global := self repository getConfigurationGlobal: true.
	username := global getString: 'user.name' ifAbsent: ''.
	email := global getString: 'user.email' ifAbsent: ''.
	
	global unset: 'user.name'.
	global unset: 'user.email'.
		
	(self repository getConfigurationGlobal: false)
		username: 'mock user';
		email: 'mock mail'.
]

{ #category : #running }
IceGitWithoutUserNameTest >> tearDown [

	| global |
	global := self repository getConfigurationGlobal: true.
	global username: username.
	global email: email.
		
	super tearDown.

]

{ #category : #tests }
IceGitWithoutUserNameTest >> testCommitWithEmptyUserMailThrowsException [

	(self repository getConfigurationGlobal: false)
		email: ''.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testCommitWithEmptyUserNameThrowsException [

	(self repository getConfigurationGlobal: false)
		username: ''.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testCommitWithoutUserMailThrowsException [

	(self repository getConfigurationGlobal: false)
		unset: 'user.email'.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testCommitWithoutUserNameThrowsException [

	(self repository getConfigurationGlobal: false)
		unset: 'user.name'.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testFixEmptyUserMailAndResumeDoesCommit [
	| before after |
	(self repository getConfigurationGlobal: false) email: ''.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	before := self repository headCommit.
	[ after := self repository commitWithMessage: 'Another commit message'.
	self assert: after notNil.
	self deny: before equals: after.
	^ self ]
		on: IceGitUsernameOrEmailNotFound
		do: [ :error | 
			(self repository getConfigurationGlobal: false) email: 'mock'.
			error resume ].
	self fail
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testFixEmptyUserNameAndResumeDoesCommit [
	| before after |
	(self repository getConfigurationGlobal: false) username: ''.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	before := self repository headCommit.
	[ after := self repository commitWithMessage: 'Another commit message'.
	self assert: after notNil.
	self deny: before equals: after.
	^ self ]
		on: IceGitUsernameOrEmailNotFound
		do: [ :error | 
			(self repository getConfigurationGlobal: false) username: 'mock'.
			error resume ].
	self fail
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testFixUnsetUserMailAndResumeDoesCommit [
	| before after |
	(self repository getConfigurationGlobal: false) unset: 'user.email'.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	before := self repository headCommit.
	[ after := self repository commitWithMessage: 'Another commit message'.
	self assert: after notNil.
	self deny: before equals: after.
	^ self ]
		on: IceGitUsernameOrEmailNotFound
		do: [ :error | 
			(self repository getConfigurationGlobal: false) email: 'mock'.
			error resume ].
	self fail
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testFixUnsetUserNameAndResumeDoesCommit [
	| before after |
	(self repository getConfigurationGlobal: false) unset: 'user.name'.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	before := self repository headCommit.
	[ after := self repository commitWithMessage: 'Another commit message'.
	self assert: after notNil.
	self deny: before equals: after.
	^ self ]
		on: IceGitUsernameOrEmailNotFound
		do: [ :error | 
			(self repository getConfigurationGlobal: false) username: 'mock'.
			error resume ].
	self fail
]

{ #category : #tests }
IceGitWithoutUserNameTest >> testUtf8Username [
	| after utf8Username |
	utf8Username := 'Yn-aë éé'.

	(self repository getConfigurationGlobal: false) username: utf8Username.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.

	after := self repository commitWithMessage: 'Another commit message'.
	
	self assert: after author equals: utf8Username
]
