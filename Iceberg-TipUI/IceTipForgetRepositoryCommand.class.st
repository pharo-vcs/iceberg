"
I will allow the ""forget"" of a repository (remote it from list of registered repositories).
I also add the possibility of remove the repository from file system.
"
Class {
	#name : 'IceTipForgetRepositoryCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipForgetRepositoryCommand class >> defaultDescription [

	^ 'Removes this repository from the list of managed repositories (it will not remove any local repository)'
]

{ #category : 'accessing - defaults' }
IceTipForgetRepositoryCommand class >> defaultName [

	^ 'Forget repository'
]

{ #category : 'executing' }
IceTipForgetRepositoryCommand >> execute [

	(IceTipRemoveRepositoryDialogPresenter 
		newApplication: context application 
		model: self repositoryModel)
		asModalWindow 
			centeredRelativeTo: context window;
			open		
]

{ #category : 'accessing' }
IceTipForgetRepositoryCommand >> iconName [

	^ #remove
]

{ #category : 'accessing' }
IceTipForgetRepositoryCommand >> shortcutKey [

	^ $x meta
]
