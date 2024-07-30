view
gtNotesFor: aView
	<gtView>
	notes ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Notes';
		priority: 30;
		object: [ self notes ];
		view: #gtLiveFor:;
		actionUpdateButton