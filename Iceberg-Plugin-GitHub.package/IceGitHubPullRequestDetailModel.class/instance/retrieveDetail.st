private
retrieveDetail
	self mergeableText text: 'Loading...'.
	[ 
	| detail| 
	detail := self pullRequest detail. 
	UIManager default defer: [ 
		self mergeableText text: ((detail at: #mergeable) ifNil: [ '' ]) ].
	] fork