Class {
	#name : #IceGitHubBranchSelectMenuGroup,
	#superclass : #CmdMenuGroup,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #parents }
IceGitHubBranchSelectMenuGroup class >> parentGroup [ 
	^IceGitHubMenuGroup 
]

{ #category : #adding }
IceGitHubBranchSelectMenuGroup >> addItem: aMenuItem [
	aMenuItem command fillContextMenu: self  using: aMenuItem activator
]

{ #category : #adding }
IceGitHubBranchSelectMenuGroup >> basicAddItem: aCmdCommandMenuItem [
	super addItem: aCmdCommandMenuItem 
]
