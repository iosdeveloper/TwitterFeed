//
//  Tweet.m
//  Created by http://github.com/iosdeveloper
//

#import "Tweet.h"

@implementation Tweet

@synthesize text, screenName, profileImageIdentifier, profileImage;

- (void)dealloc {
	[text release];
	[screenName release];
	[profileImageIdentifier release];
	[profileImage release];
	
	[super dealloc];
}

@end