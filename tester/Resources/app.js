var ctd = require('ti.crashtestdummy');
var win = Ti.UI.createWindow({backgroundColor:'white'});
var y = 10;
var btnHeight = 80;
var btnMargin = 10;
function makeButton(name,fun){
	var result = Ti.UI.createButton({top:y,left:10,right:10,height:btnHeight,title:name});
	win.add(result);
	result.addEventListener('click',fun);
	y += btnHeight + btnMargin;
}

makeButton('Javascript-triggered native exception',function(e){ctd.throwException();});
makeButton('Javascript-triggered native exception on main thread',function(e){ctd.fireInMainThreadUsingTitanium('throwException');});
makeButton('Javascript-triggered native exception on background thread',function(e){ctd.fireInBackgroundThreadUsingNative('throwException');});
makeButton('Uncaught native exception',function(e){ctd.fireInMainThreadUsingNative('throwException');});
makeButton('Hard crash',function(e){ctd.accessBadMemory();});
makeButton('Deadlock in javascript',function(e){ctd.deadlock();});
makeButton('Memory bloat',function(e){ctd.consumeMemory();});
makeButton('OS-triggered kill in foreground',function(e){ctd.fireInMainThreadUsingNative('deadlock');});
makeButton('OS-triggered kill entering background',function(e){ctd.fireInBackgroundThreadUsingNative('deadlock');});

win.open();
