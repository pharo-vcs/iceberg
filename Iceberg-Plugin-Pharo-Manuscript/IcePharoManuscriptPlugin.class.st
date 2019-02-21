"
I'm a pluging to handle fogbugz issues integration. 
It just add options to easily handle the creation of branchs with the ""convention"" issue naming format (number-plus-normalised-title): 

12345-a-sample-of-issue-branch

NOTE: In the future we can add other fogbugz elements (like list issues, etc.), but since API is very slow we will consider it very carefully. 
"
Class {
	#name : #IcePharoManuscriptPlugin,
	#superclass : #IcePlugin,
	#category : 'Iceberg-Plugin-Pharo-Manuscript'
}

{ #category : #testing }
IcePharoManuscriptPlugin class >> isAvailableFor: aRepository [

	^ aRepository remotes anySatisfy: [ :each | each projectName = 'pharo' ]
]

{ #category : #'acccessing-ui' }
IcePharoManuscriptPlugin >> checkoutBranchPanelsOnModel: aRepositoryModel [ 
	
	^ { IcePharoNewBranchFromIssuePanel on: aRepositoryModel }
]
