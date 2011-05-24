//
//  TwitterFeed.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>
#import "MGTwitterEngine.h"

@interface TwitterFeed : UITableViewController <MGTwitterEngineDelegate> {
	NSMutableArray *tweets;
	MGTwitterEngine *twitterEngine;
}

@property (retain) NSMutableArray *tweets;

- (id)initWithUsername:(NSString *)username;

@end