accessing
itemsWithCommandLike: aCommandClass 
	| groups |
	groups := self groupsWithCommandLike: aCommandClass.
	^groups 
		flatCollect: [ :each | { each. each commandItemLike: aCommandClass } ]