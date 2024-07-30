view
gtPageFor: aView
	<gtView>
	^ aView forward
		title: 'Page';
		priority: 20;
		object: [ self page ];
		view: #gtLiveFor:;
		actionUpdateButton