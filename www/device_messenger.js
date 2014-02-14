var cordovaRef = window.PhoneGap || window.cordova || window.Cordova;
	
var DeviceMessenger = function() {}

DeviceMessenger.showPdf = function(pdfContent, success, fail) {
	cordovaRef.exec(success, fail, 'DeviceMessenger', 'showPdf', [pdfContent]);
}

DeviceMessenger.sendArray = function(ar, success, fail) {
	cordovaRef.exec(success, fail, 'DeviceMessenger', 'sendArray', ar);
}

module.exports = DeviceMessenger;
