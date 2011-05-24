//
//  TwitterFeedCell.m
//  Created by http://github.com/iosdeveloper
//

#import "TwitterFeedCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation TwitterFeedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		[[self detailTextLabel] setLineBreakMode:UILineBreakModeWordWrap];
		[[self detailTextLabel] setNumberOfLines:NSIntegerMax];
		
		[[[self imageView] layer] setMasksToBounds:YES];
		[[[self imageView] layer] setCornerRadius:5.0];
		
		//[self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect rect = [[self imageView] frame];
	rect.origin.x = 5.0;
	rect.origin.y = 5.0;
	[[self imageView] setFrame:rect];
	
	rect = [[self textLabel] frame];
	rect.origin.x = 68.0;
	rect.origin.y = 5.0;
	[[self textLabel] setFrame:rect];
	
	rect = [[self detailTextLabel] frame];
	rect.origin.x = 68.0;
	rect.origin.y = 27.0;
	[[self detailTextLabel] setFrame:rect];
}

@end