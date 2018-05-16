accessing
selectedChange
	"Answer the selected change."

	^(self selectedChangeWrapper ifNil: [^nil]) item value