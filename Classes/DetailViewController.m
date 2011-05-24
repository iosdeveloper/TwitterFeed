//
//  DetailViewController.m
//  Created by http://github.com/iosdeveloper
//

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize text;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UITextView *textView = [[UITextView alloc] initWithFrame:[[self view] frame]];
	[textView setText:text];
	[textView setEditable:NO];
	[textView setDataDetectorTypes:UIDataDetectorTypeAll];
	
	[[self view] addSubview:textView];
	
	[textView release];
}

- (void)dealloc {
	[text release];
    [super dealloc];
}

@end