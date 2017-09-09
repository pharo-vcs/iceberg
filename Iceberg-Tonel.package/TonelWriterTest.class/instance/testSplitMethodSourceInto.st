tests
testSplitMethodSourceInto
	| writer declaration source definition newLine tab space |
	
	newLine := OSPlatform current lineEnding.
	tab := Character tab asString.
	space := Character space asString.
	writer := TonelWriter new.

	"simplest split"
	definition := MCMethodDefinition
		className: #SomeClass 
		selector: #name 
		category: 'accessing' 
		timeStamp: nil
		source: 'name
	^ self'.		
	writer splitMethodSource: definition into: [ :d :s | declaration := d. source := s ].
	
	self assert: declaration equals: 'name'.
	self assert: source equals: newLine, tab, '^ self'.
	
	"test space at the end of method declaration (it needs to be kept)"
	definition := MCMethodDefinition
		className: #SomeClass
		selector: #name:
		category: 'accessing'
		timeStamp: nil
		source: 'name: aString 
	name := aString'.
	writer splitMethodSource: definition into: [ :d :s | declaration := d. source := s ].
	self assert: declaration equals: 'name: aString'.
	self assert: source equals: space, newLine, tab, 'name := aString'.

	"test multiline declaration"
	definition := MCMethodDefinition
		className: #SomeClass
		selector: #method:with:several:lines:
		category: 'accessing'
		timeStamp: nil
		source: 'method: var1
	with: var2
	several: var3
	lines: var4
	
	^ var1 + var2 + var3 + var4'.
	writer splitMethodSource: definition into: [ :d :s | declaration := d. source := s ].
	self assert: declaration equals: ('method: var1
	with: var2
	several: var3
	lines: var4' withLineEndings: OSPlatform current lineEnding).
	self assert: source equals: (newLine, tab, newLine, tab, '^ var1 + var2 + var3 + var4' withLineEndings: newLine).

	"test comment before declaration (it may happen, if someone copied from diffmorph)"
	definition := MCMethodDefinition
		className: #SomeClass
		selector: #name:
		category: 'accessing'
		timeStamp: nil
		source: '
"protocol: accessing"
name: aString 
	name := aString'.
	writer splitMethodSource: definition into: [ :d :s | declaration := d. source := s ].
	self assert: declaration equals: 'name: aString'.
	self assert: source equals: space, newLine, tab, 'name := aString'.

	"test source right after declaration (no enter between selector and source)"
	definition := MCMethodDefinition
		className: #SomeClass
		selector: #name:
		category: 'accessing'
		timeStamp: nil
		source: 'name: aString name := aString'.
	writer splitMethodSource: definition into: [ :d :s | declaration := d. source := s ].
	self assert: declaration equals: 'name: aString'.
	self assert: source equals: ' name := aString'.