private
retrieveDetail
	
	self mergeablePanel widget addMorphBack: 'Loading...' asMorph.
	[ | detail mergeable |  
		[  
			detail := self pullRequest detail.
			mergeable := detail at: #mergeable ]
		on: Error do: [ :e | mergeable := nil ].
		UIManager default defer: [ 
			self mergeablePanel widget
				removeAllMorphs;
				addMorphBack: (self iconForMergeable: mergeable) asMorph;
				addMorphBack: (self textForMergeable: mergeable) asMorph ]
	] fork