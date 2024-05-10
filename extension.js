globalThis.self = globalThis.self ?? {};
// Load the compiled Dart code which will add the functions
// into globalThis.self.
require('./out/extension.js');

module.exports = {
	activate: function(context) {
		console.log('wrapper activate');
		globalThis.self['vs_code_dart_activate'](context);
	},
	deactivate: function() {
		console.log('wrapper deactivate');
		globalThis.self['vs_code_dart_deactivate']();
	},
}
