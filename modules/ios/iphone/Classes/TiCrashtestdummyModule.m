/**
 * CrashTestDummy
 *
 * Created by Blain Hamon, TZ Martin
 * Copyright (c) 2016
 */

#import "TiCrashtestdummyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiCrashtestdummyModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"1d29994e-5c49-4861-aded-92ae960f8cbe";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.crashtestdummy";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    storage = [[NSMutableArray alloc] initWithCapacity:10];
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
    [storage release];
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

/*
 *	Usage: This is to slowly leak memory, as storage never stops holding onto its contents.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.addToStorage("Store me!");
 */
-(void)addToStorage:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Adding %@ to storage in thread %@",args,[NSThread currentThread]);
        [storage addObject:args];
    }
}

/*
 *	Usage: This is to quickly leak memory, as we enter an infinite loop to fill storage.
 *	This is to spur a memory panic and then force kill from the OS.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.consumeMemory();
 */
-(void)consumeMemory:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to infinite loop and allocate memory in thread %@",[NSThread currentThread]);
        int counter = 0;
        while (self != [self class]) {
            [storage addObject:[NSString stringWithFormat:@"Line %d: "
                                "Appcelerator started with the idea that mobile will impact our lives even more than the web. Jeff Haynie (CEO) and Nolan Wright (CTO) founded Appcelerator in 2006 in Atlanta, Georgia and started building software to enable developers to create great apps – initially rich applications for the web, then desktop and by 2008, mobile.",counter++]];
        }
    }
}

/*
 *	Usage: This is to lock twice, never recovering.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.deadlock();
 */
-(void)deadlock:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to deadlock in thread %@",[NSThread currentThread]);
        NSLock * unsafeLock = [[NSLock alloc] init];
        [unsafeLock setName:@"Dead lock test"];
        [unsafeLock lock];
        [unsafeLock lock];
        [unsafeLock release];
    }
}

/*
 *	Usage: This is to infinite loop, never recovering.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.infiniteLoop();
 */
-(void)infiniteLoop:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to infinite loop in thread %@",[NSThread currentThread]);
        while (self != [self class]) {
            if (self == [self class]) {
                return;
            }
        }
        return;
    }
}

/*
 *	Usage: This is to create a hard crash, by way of a segfault when we dereference a bad pointer.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.accessBadMemory();
 */
-(void)accessBadMemory:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to release a bad memory location in thread %@",[NSThread currentThread]);
        CFRelease((CFStringRef)-1);
    }
}

/*
 *	Usage: This is to create a hard crash, by way of a segfault when we overrelease memory.
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.overReleaseMemory();
 */
-(void)overReleaseMemory:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to over release memory in thread %@",[NSThread currentThread]);
        NSString * myString = [NSString stringWithFormat:@"%@ String!",self];
        [myString release];
        [myString release];
        [myString release];
    }
}

/*
 *	Usage: This is to throw an exception
 *	var ctd = require('ti.crashtestdummy');
 *	ctd.throwException();
 */
-(void)throwException:(id)args
{
    @autoreleasepool {
        NSLog(@"[DEBUG] Preparing to throw exception in thread %@",[NSThread currentThread]);
        [NSException raise:@"ExceptionText" format:@"This is a test of exception handling, intentionally raised by CrashTestDummy."];
    }
}

/*
 *	Usage: This is to invoke another method in the main thread within Titanium's structure
 *	The first arguement is the name of the method to call,
 *	var ctd = require('ti.crashtestdummy');
 *	try {
 *		ctd.fireInMainThreadUsingTitanium('throwException'); //Should be safe exception.
 *	} catch (e) {}
 *	ctd.fireInMainThreadUsingTitanium('throwException'); //Should lock up UI.
 */
-(void)fireInMainThreadUsingTitanium:(id)args
{
    ENSURE_ARG_COUNT(args, 1);
    NSString * methodName = [[args objectAtIndex:0] stringByAppendingString:@":"];
    NSArray * arguments = [args subarrayWithRange:NSMakeRange(1, [args count]-1)];
    NSLog(@"[DEBUG] Will be calling %@ in main thread using Titanium's methods",methodName);
    SEL method = NSSelectorFromString(methodName);
    TiThreadPerformOnMainThread(^{
        [self performSelector:method withObject:arguments];
    }, NO);
}

/*
 *	Usage: This is to invoke another method in the main thread within Titanium's structure
 *	The first arguement is the name of the method to call,
 *	var ctd = require('ti.crashtestdummy');
 *	try {
 *		ctd.fireInMainThreadUsingNative('throwException'); //Should crash app.
 *	} catch (e) {}
 *	ctd.fireInMainThreadUsingNative('deadlock'); //Should lock up UI.
 */
-(void)fireInMainThreadUsingNative:(id)args
{
    ENSURE_ARG_COUNT(args, 1);
    NSString * methodName = [[args objectAtIndex:0] stringByAppendingString:@":"];
    NSArray * arguments = [args subarrayWithRange:NSMakeRange(1, [args count]-1)];
    NSLog(@"[DEBUG] Will be calling %@ in main thread using native methods",methodName);
    SEL method = NSSelectorFromString(methodName);
    [self performSelector:method onThread:[NSThread mainThread] withObject:arguments waitUntilDone:NO];
}

/*
 *	Usage: This is to invoke another method in the main thread within Titanium's structure
 *	The first arguement is the name of the method to call,
 *	var ctd = require('ti.crashtestdummy');
 *	try {
 *		ctd.fireInBackgroundThreadUsingNative('throwException'); //Should crash app.
 *	} catch (e) {}
 *	ctd.fireInBackgroundThreadUsingNative('deadlock'); //Should cause the app to be force killed on background.
 */
-(void)fireInBackgroundThreadUsingNative:(id)args
{
    ENSURE_ARG_COUNT(args, 1);
    NSString * methodName = [[args objectAtIndex:0] stringByAppendingString:@":"];
    NSArray * arguments = [args subarrayWithRange:NSMakeRange(1, [args count]-1)];
    NSLog(@"[DEBUG] Will be calling %@ in background thread using native methods",methodName);
    SEL method = NSSelectorFromString(methodName);
    [self performSelectorInBackground:method withObject:arguments];
}

@end
