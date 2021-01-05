"
I will allow the ""forget"" of a repository (remote it from list of registered repositories).
I also add the possibility of remove the repository from file system.
"
Class {
	#name : #IceTipForgetRepositoryCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipForgetRepositoryCommand class >> defaultDescription [

	^ 'Removes this repository from the list of managed repositories (it will not remove any local repository)'
]

{ #category : #accessing }
IceTipForgetRepositoryCommand class >> defaultName [

	^ 'Forget repository'
]

{ #category : #execution }
IceTipForgetRepositoryCommand >> execute [

	(IceTipRemoveRepositoryDialog on: self repositoryModel)
		openDialogWithSpec
]

{ #category : #accessing }
IceTipForgetRepositoryCommand >> iconName [

	^ #remove
]

{ #category : #accessing }
IceTipForgetRepositoryCommand >> shortcutKey [

	^ $x meta
]
