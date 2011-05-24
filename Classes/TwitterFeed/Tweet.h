//
//  Tweet.h
//  Created by http://github.com/iosdeveloper
//

@interface Tweet : NSObject {
	NSString *text;
	NSString *screenName;
	NSString *profileImageIdentifier;
	UIImage *profileImage;
}

@property (retain) NSString *text;
@property (retain) NSString *screenName;
@property (retain) NSString *profileImageIdentifier;
@property (retain) UIImage *profileImage;

@end