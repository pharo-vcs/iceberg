private
add: item
	self selectedItems add: item.
	self onSelectionChangedBlock ifNotNil: [ :block | block cull: item cull: true ]
	