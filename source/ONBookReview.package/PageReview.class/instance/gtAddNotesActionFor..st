actions
gtAddNotesActionFor: anAction
	<gtAction>
	self notes ifNotNil: [ ^ anAction empty ].
	^ anAction button
		icon: BrGlamorousIcons add;
		priority: 20;
		tooltip: 'Add notes';
		action: [ :aButton | 
			self addNotesPage.
			aButton phlow spawnTool: self notes asLepiterPagePhlowTool ]