private
selectionHasActualClass
	"Answer whether the currently selected change has an actual
	class in the image."

	^self selectedChangeWrapper
		ifNil: [false]
		ifNotNil: [:w | w item value contextClass notNil]