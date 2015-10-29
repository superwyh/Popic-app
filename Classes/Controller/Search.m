//
//  Search.m
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "Search.h"
#import "JSON.h"
#import "SearchResultController.h"
#import "ServerConfig.h"
#import "PostBar_Model.h"
@implementation Search
@synthesize delegate;
@synthesize searchResultController;
@synthesize m_uid;
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
-(void)viewDidLoad
{
	
}
#pragma mark -
#pragma mark IBAction
-(void)setUid:(int)uid
{
	self.m_uid=uid;
}
-(IBAction)goSearch{
	[searchTextField resignFirstResponder];
	// The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	
    // Add HUD to screen
    [self.view addSubview:HUD];
	
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
	
    HUD.labelText = @"Loading...";
	
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(goSearchHUD) onTarget:self withObject:nil animated:YES];
}
-(IBAction)goSearchHUD
{
	
	NSDictionary *results=[[PostBar_Model ShareObjects]Search:searchTextField.text IsTopicOrPost:TopicOrPost];
	if (TopicOrPost) {

		if (results ==nil) {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!"
														 message:@"The topic you searched doesn't exit!" 
														delegate:self
											   cancelButtonTitle:@"Create" 
											   otherButtonTitles:@"Back",nil];
			alert.tag=105;
			[alert show];
			[alert release];
		}else {
			searchTextField.text=@"";
			NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:results , @"results" ,
								  [NSNumber numberWithBool:YES] , @"istopic",nil] ;
			
			[[NSNotificationCenter defaultCenter] postNotificationName:@"addSubview" object:dict];			
	     
	     }
	}else {

		if (results==nil) {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!"
														 message:@"The post you searched doesn't exit" 
														delegate:self
											   cancelButtonTitle:@"Ok" 
											   otherButtonTitles:nil];
			
			[alert show];
			[alert release];
		}else {
			
			
			NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:results , @"results" ,
													[NSNumber numberWithBool:NO] , @"istopic",
																							nil] ;
			searchTextField.text=@"";
			[[NSNotificationCenter defaultCenter] postNotificationName:@"addSubview" object:dict];
			
			}
			
        }
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
if (alertView.tag==105) {
	if (buttonIndex==0) {
		NSString *stringdata=[[PostBar_Model ShareObjects]creatTopic:searchTextField.text];
	
		if ([stringdata isEqualToString:@"Let CiTie already exists!"]) {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!"
														 message:@"The Post Which You Choosed Was Already Exists" 
														delegate:self
											   cancelButtonTitle:@"Ok" 
											   otherButtonTitles:nil];
			[alert show];
			[alert release];
			
        }else if ([stringdata isEqualToString:@"400"]) {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice"
														 message:@"Wrong!" 
														delegate:self
											   cancelButtonTitle:@"Ok" 
											   otherButtonTitles:nil];
			[alert show];
			[alert release];
		}else {
			
			NSDictionary *dic=[stringdata JSONValue];
			for (NSDictionary *data in dic) {
				int tid=[[data objectForKey:@"tid"] intValue];
				[delegate loadTopic:searchTextField.text Tid:tid ];
				
			}
			searchTextField.text=@"";
			
			
		}

		
	}
 }
}

-(IBAction)topicTouchButton:(id)sender{
	UIButton * tempsender=(UIButton *)sender;
	[tempsender setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateNormal];
	[postsButton setImage:[UIImage imageNamed:@"quan.png"] forState:UIControlStateNormal];
   	TopicOrPost=YES;

	}

-(IBAction)postsTouchButton:(id)sender{
	UIButton * tempsender=(UIButton *)sender;
	[tempsender setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateNormal];
	[topicButton setImage:[UIImage imageNamed:@"quan.png"] forState:UIControlStateNormal];
	TopicOrPost=NO;
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}

#pragma mark -
#pragma mark UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    // called when 'return' key pressed. return NO to ignore.
	[searchTextField resignFirstResponder];
	return YES;
}
#pragma mark -
#pragma mark MBProgressHUD
-(void)hudWasHidden:(MBProgressHUD *)hud{
	[hud removeFromSuperview];
	[hud release];
}
@end
