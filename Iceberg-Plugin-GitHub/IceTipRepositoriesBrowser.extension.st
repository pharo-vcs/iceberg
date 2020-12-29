Extension { #name : #IceTipRepositoriesBrowser }

{ #category : #'*Iceberg-Plugin-GitHub' }
IceTipRepositoriesBrowser class >> githubCommandsWith: presenter forRootGroup: aCommandGroup [

	<extensionCommands>

	| pluginGroup remotesGroup |
	pluginGroup := CmCommandGroup forSpec
		name: 'Github';
		description: 'Github operations';
		iconName: #github;
		yourself.
		
	remotesGroup := CmCommandGroup forSpec
		name: 'Remotes';
		yourself.

	{ IceGitHubNewBranchFromIssueCommand.
	  IceFiletreeToTonelCommand }
			do: [ :each | pluginGroup register: each forSpec ].

	(aCommandGroup / self selectionCommandGroupName) 
		register: pluginGroup. 


	(presenter hasSelectedItem and: [
		presenter selectedItem hasRemotes ]) ifTrue: [
			presenter selectedItem remoteModels do: [ :each |
				self
					githubRemoteCommands: each
					forRootGroup: remotesGroup ] ].
	pluginGroup register: remotesGroup.

]

{ #category : #'*Iceberg-Plugin-GitHub' }
IceTipRepositoriesBrowser class >> githubRemoteCommands: anIceRemoteModel forRootGroup: aCommandGroup [

	| thisRemoteGroup |
	thisRemoteGroup := CmCommandGroup forSpec
		name: anIceRemoteModel name;
		yourself.
	aCommandGroup register: thisRemoteGroup.

	"Note: The following commands use the remote model as a context, while the default
	context is the presenter."
	{ 	IceGitHubNewPullRequestCommand.
		IceGitHubOpenOnGithubCommand.
		IceGitHubRemoveBranchesCommand.
		IceGitHubViewPullRequestsCommand }
			do: [ :each | 
				thisRemoteGroup register: (each forSpecContext: anIceRemoteModel) ]

]
