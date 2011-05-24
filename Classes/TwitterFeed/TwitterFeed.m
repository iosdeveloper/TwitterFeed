//
//  TwitterFeed.m
//  Created by http://github.com/iosdeveloper
//

#import "TwitterFeed.h"
#import "DetailViewController.h"
#import "Tweet.h"
#import "TwitterFeedCell.h"

@implementation TwitterFeed

@synthesize tweets;

#pragma mark -
#pragma mark Initialization

- (id)initWithUsername:(NSString *)username {
    self = [super init];
    if (self) {
		[self setTweets:[[NSMutableArray alloc] init]];
		
		twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
		
		NSLog(@"MGTwitterEngine version %@", [MGTwitterEngine version]);
		
		[twitterEngine setUsesSecureConnection:NO];
		[twitterEngine setUsername:username];
		
		[twitterEngine getUserTimelineFor:[twitterEngine username] sinceID:0 startingAtPage:0 count:NSIntegerMax];
    }
    return self;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self tweets] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[TwitterFeedCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Tweet *tweet = [[self tweets] objectAtIndex:[indexPath row]];
	
	[[cell textLabel] setText:[tweet screenName]];
	[[cell detailTextLabel] setText:[tweet text]];
	[[cell imageView] setImage:[tweet profileImage]];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	Tweet *tweet = [[self tweets] objectAtIndex:[indexPath row]];
	
	float height = [[tweet text] sizeWithFont:[UIFont systemFontOfSize:14.0] constrainedToSize:CGSizeMake(300.0 - 58.0, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap].height;
	
	if (height == 18.0) {
		height += 5.0;
	}
	
	return 5.0 + 22.0 + height + 5.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
	
	Tweet *tweet = [[self tweets] objectAtIndex:[indexPath row]];
	
	[detailViewController setText:[tweet text]];
	
	[[self navigationController] pushViewController:detailViewController animated:YES];
	
	[detailViewController release];
}

#pragma mark -
#pragma mark MGTwitterEngineDelegate

- (void)requestSucceeded:(NSString *)connectionIdentifier {
	NSLog(@"Request succeeded for connectionIdentifier = %@", connectionIdentifier);
}

- (void)requestFailed:(NSString *)connectionIdentifier withError:(NSError *)error {
	NSLog(@"Request failed for connectionIdentifier = %@, error = %@ (%@)",
		  connectionIdentifier,
		  [error localizedDescription],
		  [error userInfo]);
}

- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)connectionIdentifier {
	for (NSDictionary *dict in statuses) {
		NSString *text = [dict objectForKey:@"text"];
		NSString *screenName = [[dict objectForKey:@"user"] objectForKey:@"screen_name"];
		NSString *profileImageIdentifier = [twitterEngine getImageAtURL:[[dict objectForKey:@"user"] objectForKey:@"profile_image_url"]];
		
		Tweet *tweet = [[Tweet alloc] init];
		[tweet setText:text];
		[tweet setScreenName:screenName];
		[tweet setProfileImageIdentifier:profileImageIdentifier];
		
		[[self tweets] addObject:tweet];
		
		[tweet release];
	}
	
	[[self tableView] performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void)imageReceived:(UIImage *)image forRequest:(NSString *)connectionIdentifier {
	for (int i = 0; i < [[self tweets] count]; i ++) {
		Tweet *tweet = [[self tweets] objectAtIndex:i];
		
		if ([connectionIdentifier isEqualToString:[tweet profileImageIdentifier]]) {
			[tweet setProfileImage:image];
			
			[[self tweets] replaceObjectAtIndex:i withObject:tweet];
			
			[[self tableView] performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
		}
	}
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[twitterEngine release];
	[tweets release];
	
    [super dealloc];
}

@end