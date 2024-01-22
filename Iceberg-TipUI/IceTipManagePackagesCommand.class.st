"
I'm a command to open the package manager browser for a project.
"
Class {
	#name : 'IceTipManagePackagesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipManagePackagesCommand class >> defaultDescription [

	^ 'Open packages manager browser for this repository'
]

{ #category : 'accessing - defaults' }
IceTipManagePackagesCommand class >> defaultName [

	^ 'Packages'
]

{ #category : 'executing' }
IceTipManagePackagesCommand >> execute [

	(IceTipWorkingCopyBrowser 
		newApplication: context application 
		model: self repositoryModel workingCopyModel) 
		open
]

{ #category : 'accessing' }
IceTipManagePackagesCommand >> iconName [

	^ #package
]

{ #category : 'accessing' }
IceTipManagePackagesCommand >> shortcutKey [

	^ $p meta
]
