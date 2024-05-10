const vscode = require('vscode');

function dartMainRunner() {
	console.log('dartMainRunner');
}

function activate(context) {
	globalThis.self = {};
	console.log('activate');
	const dartExtension = require('./out/extension.js');
	console.log(dartExtension);
	console.log(Object.keys(dartExtension));
	console.log(globalThis.self['vscode_dart']);
	console.log(globalThis.self['vscode_dart'].activate);
}

function deactivate() { }

module.exports = {
	activate,
	deactivate
}
