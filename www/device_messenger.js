var DeviceMessenger = (function() {
	
	var cordovaRef = window.PhoneGap || window.cordova || window.Cordova;
	
	function showPdf(pdfContent, success, fail) {
		cordova.exec(success, fail, 'DeviceMessenger', 'showPdf', [pdfContent]);
	}
	
	function sendArray(ar, success, fail) {
		cordova.exec(success, fail, 'DeviceMessenger', 'sendArray', ar);
	}
	
	return {
		showPdf:showPdf,
		sendArray:sendArray
	}
	
}());
