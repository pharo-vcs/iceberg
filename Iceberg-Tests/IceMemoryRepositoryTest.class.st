"
I test IceMemoryRepository directly, without the repository fixtures.
"
Class {
	#name : 'IceMemoryRepositoryTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'tests' }
IceMemoryRepositoryTest >> testCommitIsNewerThanItsAncestors [
	"Branch heads are the versions with the latest timestamp. An ancestor stamped in the future stands for a clock that did not move between two commits."

	| future ancestor commit |
	future := DateAndTime now + 1 hour.
	ancestor := MCVersionInfo
		            name: 'master'
		            id: UUID new
		            message: 'ancestor'
		            date: future asDate
		            time: future asTime
		            ancestors: #(  ).

	commit := IceMemoryRepository new
		          commitPackage: (MCPackage named: 'master')
		          author: 'author'
		          message: 'commit'
		          ancestors: { ancestor }
		          dependencies: #(  )
		          inInternalRepository: MCDictionaryRepository new.

	self assert: commit info timeStamp > ancestor timeStamp
]
