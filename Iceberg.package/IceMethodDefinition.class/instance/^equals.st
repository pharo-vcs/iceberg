comparing
= anotherDefinition
	"A method can be equal and belong to another class (and be in the other side). 
	 And yes, even if this usually should not happen, it happens (and not always is incorrect)"
	^ super = anotherDefinition 
		and: [ self className = anotherDefinition className 
		and: [ self classIsMeta = anotherDefinition classIsMeta ] ]