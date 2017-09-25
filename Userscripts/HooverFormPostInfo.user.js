	// ==UserScript==
	// @name		  Display Form Action
	// @namespace	  http://diveintomark.org/projects/greasemonkey/	
	// @description	  display form submission URL as tooltip of submit button	
	// @include		  *
	// ==/UserScript==

	for (var i = document.formsforms.length - 1; i >= 0; i--) {
		var elmForm = document.forms[i];
		var arElmFormFields = elmForm.getElementsByTagName('input');
		var arNames = new Array();
		for (var j = arElmFormFields.length - 1; j >= 0; j--) {
			var sName = arElmFormFields[j].name ||
				arElmFormFields[j].id;
			if (sName) {
				arNames.push(sName);
			}
		}
		var sFormFields = arNames.join(', ');
		var snapSubmit = document.evaluate("//input[@type='submit']",	
			elmForm, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
		for (var j=snapSubmit.snapshotLength-1; j>=0; j--) {
			var elmSubmit = snapSubmit.snapshotItem(j);
			elmSubmit.title = (elmForm.method.toUpperCase() || 'GET') +
				' ' + elmForm.action + ' with ' + sFormFields;
		}
	}