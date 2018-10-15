initialization
initializeExistingTagsList
	existingTagsList := self newList.
	existingTagsList
		items: commitishToTag tagModels;
		displayBlock: #name;
		sortingBlock: #name descending