"
This command represent the commands with submenus to select remotes
"
Class {
	#name : #IceGitHubBranchSelectCommand,
	#superclass : #IceGitHubCommand,
	#instVars : [
		'remote'
	],
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #'as yet unclassified' }
IceGitHubBranchSelectCommand >> askRemote [
	^ repositoryModel remotes anyOne

]

{ #category : #accessing }
IceGitHubBranchSelectCommand >> defaultMenuItemName [
	^ remote ifNotNil: [ remote name , ' (' , remote url , ')' ] ifNil: [ self itemNameWithoutBranches ]
]

{ #category : #'context menu' }
IceGitHubBranchSelectCommand >> fillContextMenu: aMenu using: aCommandActivator [

	| item activator|

	self repository remotes do: [ :eachRemote | 
		"We need copies to allow to create multiple different MenuItem with different remotes"
		activator := aCommandActivator copy.
		activator command: activator command copy.
		item := CmdCommandMenuItem activatingBy: activator.
		activator setUpShortcutTipForMenuItem: item.
		activator command remote: eachRemote.
		aMenu basicAddItem: item	.
		].
]

{ #category : #accessing }
IceGitHubBranchSelectCommand >> itemNameWithoutBranches [
	self subclassResponsibility 
]

{ #category : #accessing }
IceGitHubBranchSelectCommand >> remote [
	^ remote
]

{ #category : #accessing }
IceGitHubBranchSelectCommand >> remote: aRemote [
	^ remote := aRemote
]
