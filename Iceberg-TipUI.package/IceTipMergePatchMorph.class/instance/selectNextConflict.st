actions
selectNextConflict
	"Select the next conflict after the current selection, if any."

	|next |
	next := self nextConflict ifNil: [^self].
	self changed: {#openPath}, next item path segments