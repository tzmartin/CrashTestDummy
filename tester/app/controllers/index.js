var ctd = require('ti.crashtestdummy');

function doJSTriggeredNativeException(e){
	ctd.throwException();
}

function doJSTriggeredNativeExceptionOnMainThread(e){
	ctd.fireInMainThreadUsingTitanium('throwException');
}

function doJSTriggeredNativeExceptionOnBackgroundThread(e){
	ctd.fireInBackgroundThreadUsingNative('throwException');
}

function doUncaughtNativeException(e){
	ctd.fireInMainThreadUsingNative('throwException');
}

function doHardCrash(e){
	ctd.accessBadMemory();
}

function doDeadlockInJS(e){
	ctd.deadlock();
}

function doMemoryBloat(e){
	ctd.consumeMemory();
}

function doOSTriggeredKillInForeground(e){
	ctd.fireInMainThreadUsingNative('deadlock');
}
function doOSTriggeredKillEnteringBackground(e){
	ctd.fireInBackgroundThreadUsingNative('deadlock');
}


var rows = [
	{ title: 'Javascript-triggered native exception', callback: doJSTriggeredNativeException },
	{ title: 'Javascript-triggered native exception on main thread', callback: doJSTriggeredNativeExceptionOnMainThread },
	{ title: 'Javascript-triggered native exception on background thread', callback: doJSTriggeredNativeExceptionOnBackgroundThread },
	{ title: 'Uncaught native exception', callback: doUncaughtNativeException },
	{ title:'Hard Crash', callback:doHardCrash },
	{ title: 'Deadlock in javascript', callback: doDeadlockInJS },
	{ title: 'Memory Bloat', callback: doMemoryBloat },
	{ title: 'OS-triggered kill in foreground', callback: doOSTriggeredKillInForeground },
	{ title: 'OS-triggered kill entering background', callback: doOSTriggeredKillEnteringBackground }
];

rows.forEach(function(row){
	$.table.appendRow(Alloy.createController('row',row).getView());
});

$.index.open();
