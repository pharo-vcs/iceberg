as yet unclassified
recordChoiceProject: projectName optionA: optionA optionB: optionB ifAbsentAnswer: aBlock
	
	^ choices 
		detect: [ :each | 
			(each projectName = projectName)
			and: [ each isChoiceBetween: optionA and: optionB ] ]
		ifFound: [ :choice | choice choosen ]
		ifNone: [ | choosen |
			choosen := aBlock value.
			choosen ifNotNil: [  
				self recordChoice: (IceMetacelloLoadChoice new 
					projectName: projectName;
					optionA: optionA;
					optionB: optionB;
					choosen: choosen;
					yourself) ].
			choosen ]