//
//  DetailImage.m
//  PostBar
//
//  Created by chen on 5/26/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "DetailImage.h"


@implementation DetailImage
@synthesize detailContextImage;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
-(IBAction)backTouchButton{
	[self.view removeFromSuperview];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	[self flushContent];
    [super viewDidLoad];
}

- (void) flushContent {
	[detailImage setImage:detailContextImage];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[detailContextImage release];
    [super dealloc];
}
#pragma mark -
#pragma mark myAction-
	
@end
