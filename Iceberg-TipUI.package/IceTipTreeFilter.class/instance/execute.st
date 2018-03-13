execution
execute
	| root |
	
	root := IceTipTreeGroup new.
	self dataSource rootItem children do: [ :eachRoot |
		eachRoot data traversingDo: [ :each | 
			each isLeaf ifTrue: [ 
				(self matches: each) ifTrue: [ 
					(root ensurePath: each path allButLast) addChild: each ] ] ] ].
	"clean parent because they are roots (otherwise it will broke a 2nd filter tour)"
	root children do: [ :each | each parent: nil ].
	^ self dataSource copy
		rootForItems: root children;
		yourself