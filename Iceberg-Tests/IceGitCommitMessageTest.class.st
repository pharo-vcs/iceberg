Class {
	#name : 'IceGitCommitMessageTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitCommitMessageTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : 'tests' }
IceGitCommitMessageTest >> testCommitEmptyString [	
	self repository commitWithMessage: ''.
	
	self assert: self repository head commit comment isEmpty.

]

{ #category : 'tests' }
IceGitCommitMessageTest >> testCommitNullString [	
	self should: [self repository commitWithMessage: nil] raise: Error.
	

]

{ #category : 'tests' }
IceGitCommitMessageTest >> testCommitWideString [
	| msg |
	msg := ZnUTF8Encoder new decodeBytes: (ByteArray readHexFrom: 'e38182e38184e38186'). "Japanese vowels a,i, and u - 'あいう'"
	self repository commitWithMessage: msg.
	self assert: self repository head commit comment equals: msg.

]

{ #category : 'tests' }
IceGitCommitMessageTest >> testCommitWithEndingPesosSign [
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |
	msg := 'Adding Tests to making obsolete a class.'.
	self repository commitWithMessage: msg.
	self assert: self repository head commit comment equals: msg.

]

{ #category : 'tests' }
IceGitCommitMessageTest >> testCommitWithoutPesosSign [
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |
	msg := '123456789'.
	self repository commitWithMessage: msg.
	self assert: self repository head commit comment equals: msg.

]

{ #category : 'tests' }
IceGitCommitMessageTest >> testDifferentSizes [
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |

	self timeLimit: 1 minute.
	msg := ''.
	
	1 to: 40 do: [ :size | 
		msg := msg , (size % 10) asString.
		self repository commitWithMessage: msg.
		self assert: self repository head commit comment equals: msg.
		self repository workingCopy addPackageNamed: 'NewPackage' , size asString.
	].

]
