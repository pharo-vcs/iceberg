private
pushTo: aRemote then: aBlock
	"We need an existing remote as premise to do the push (new repositories can have this 
	 situation)"
	aRemote ifNil: [ 
		^ UIManager default
			abort: 'There is no remote to publish, please add one (in "remotes" tab).'
			title: 'Publishing aborted' ].
	[ 
		UIManager default informUserDuring: [ :bar | 
			bar label: ('Publishing local commits to {1}' format: { aRemote url }).
			self repository pushTo: aRemote. 
			aBlock value ] ] 
	on: IceRemoteDesynchronized , IceMergeAborted
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: self repository) ]