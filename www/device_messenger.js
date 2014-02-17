var cordovaRef = window.PhoneGap || window.cordova || window.Cordova;
	
var DeviceMessenger = function() {}

DeviceMessenger.openFile = function(fileContentBase64, fileName, success, fail) {
	cordovaRef.exec(success, fail, 'DeviceMessenger', 'openFile', [fileContentBase64, fileName]);
}

DeviceMessenger.sendArray = function(ar, success, fail) {
	cordovaRef.exec(success, fail, 'DeviceMessenger', 'sendArray', ar);
}

module.exports = DeviceMessenger;
