//
//  AppDelegate.m
//  Created by http://github.com/iosdeveloper
//

#import "AppDelegate.h"
#import "TwitterFeed.h"

@implementation AppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[self window] setRootViewController:
	 [[[UINavigationController alloc] initWithRootViewController:
	  [[[TwitterFeed alloc] initWithUsername:@"twitter"] autorelease]] autorelease]];
    [[self window] makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [window release];
    [super dealloc];
}

@end