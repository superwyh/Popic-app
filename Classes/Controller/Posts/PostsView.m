//
//  PostsView.m
//  PostBar
//
//  Created by chen on 5/27/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "PostsView.h"
#import "LookRevertController.h"
#import "JSON.h"
#import "ASIFormDataRequest.h"
#import "ServerConfig.h"
#import "PostBar_Model.h"
#import "MBProgressHUD.h"
@implementation PostsView
@synthesize fromWebView;
@synthesize fromLabel;
@synthesize titleLabel;
@synthesize m_pid;
@synthesize m_Puid;
@synthesize toTextView;
@synthesize m_image;
@synthesize m_viewNew;
@synthesize m_buttonPic;
@synthesize m_buttonMusic;
@synthesize musicData;
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
-(IBAction)back{
	[self.view removeFromSuperview];
}
//-(IBAction)LookRevert{
//  // The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
//  HUD = [[MBProgressHUD alloc] initWithView:self.view];
//
//  // Add HUD to screen
//  [self.view addSubview:HUD];
//
//  // Regisete for HUD callbacks so we can remove it from the window at the right time
//  HUD.delegate = self;
//
//  HUD.labelText = @"Loading...";
//
//  // Show the HUD while the provided method executes in a new thread
//  [HUD showWhileExecuting:@selector(LookRevertHUD) onTarget:self withObject:nil animated:YES];
//}
-(IBAction)LookRevert
{
/*	//NSArray *arr=[[NSArray alloc]init];
	dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
		// Show the HUD in the main tread 
		dispatch_async(dispatch_get_main_queue(), ^{
			// No need to hod onto (retain)
			MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
			hud.labelText = @"Loading...";
		});


	   //http://192.168.1.14:8080/PostBar/servlet/RepostServlet?op=getinfobypid&pid=3
		
	   arr = [[PostBar_Model ShareObjects] Comments:m_pid];
		
				// Hide the HUD in the main tread 
		 dispatch_async(dispatch_get_main_queue(), ^{
		 [MBProgressHUD hideHUDForView:self.view animated:YES];
		 });
	
		 });		
 */
	[activity startAnimating];
	[activity setHidden:NO];
	[self performSelector:@selector(perfectData) withObject:nil afterDelay:0.5f];
}

- (void) perfectData {

	NSArray *arr = [[PostBar_Model ShareObjects] Comments:m_pid];
	[activity stopAnimating];
	[activity setHidden:YES];
	
	if (arr) {
		[[NSNotificationCenter defaultCenter]postNotificationName:@"LookRevert" object:arr];	
	}else {
		NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:m_pid],@"pid",titleLabel.text,@"pname",[NSNumber numberWithInt:m_Puid],@"puid",nil];
		[[NSNotificationCenter defaultCenter]postNotificationName:@"LookRevert" object:dic];	
	}
}

-(IBAction)playORpause{
	
	if (!player.playing) {
		[player play];
	}else {
		[player pause];
	}
}
	
-(IBAction)LookBigPic
{
	UIView *viewNew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
	self.m_viewNew=viewNew;
	[viewNew release];
	[m_viewNew setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:m_viewNew];
	
	UIImageView *imageViewPic=[[UIImageView alloc]initWithImage:m_image];
	[imageViewPic setFrame:CGRectMake(0, 0, 320, 460-53)];
	[m_viewNew addSubview:imageViewPic];
	
	UIImageView *imageViewBG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 407, 320, 53)];
	[imageViewBG setImage:[UIImage imageNamed:@"0001"]];
	[m_viewNew addSubview:imageViewBG];
	
	// =[[UIButton alloc]initWithFrame:CGRectMake(4, 413, 72, 47)];
	UIButton    *button=[UIButton  buttonWithType:UIButtonTypeCustom];
	[button setFrame:CGRectMake(4, 413, 72, 47)];
	//[button setBackgroundImage:[UIImage imageNamed:@"Back.png"]  forState:UIControlStateNormal];
	[button setImage:[UIImage imageNamed:@"Back.png"] forState:UIControlStateNormal];
	[button addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
	//[m_viewNew insertSubview:button belowSubview:imageViewBG];
	[m_viewNew addSubview:button];
	

	
	[imageViewBG release];
	[imageViewPic release];

}
-(void)backView
{
	[m_viewNew removeFromSuperview];
}
-(IBAction)replayPost{
	[toTextView resignFirstResponder];
//	[toTextView resignFirstResponder];
	//[NSThread sleepForTimeInterval:1] ;
	// The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	
    // Add HUD to screen
    [self.view addSubview:HUD];
	
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
	
    HUD.labelText = @"Loading...";
	
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(replayPostHUD) onTarget:self withObject:nil animated:YES];
}
-(IBAction)replayPostHUD
{
	
	
	if ([toTextView.text isEqualToString:@""]) {
	 	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!" 
													 message:@"You don't want to say something?"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}else {
		NSString *stringdata=[[PostBar_Model ShareObjects] RePost:m_pid Recontent:toTextView.text Puid:m_Puid Pname:titleLabel.text];
		
		[self performSelectorOnMainThread:@selector(showInfo:) withObject:stringdata waitUntilDone:YES];
	}
		
}

- (void) showInfo :(NSString *) stringdata {
	
	if ([stringdata isEqualToString:@"Reply to success!"]) {
		
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"success!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		alert.tag=1001;
		[alert show];
		[alert release];
	}else
	{
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"fail!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}

}
-(IBAction)savePosts
{
	NSString *stringdata=[[PostBar_Model ShareObjects]SavePost:m_pid];
	if ([stringdata isEqualToString:@"Modify success!"]) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"This post has been added to your favorite!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}else if ([stringdata isEqualToString:@"Already added!"]) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"This post has been already added"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}else
	{
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"fail!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}
}
-(void)setPid:(int)pid Puid:(int)Puid 
{
	self.m_pid	=pid;
	self.m_Puid	=Puid;
}
-(IBAction)bigTouchButton{
	//[fromTextView resignFirstResponder];
	[toTextView resignFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	fromWebView.backgroundColor=[UIColor clearColor];
	fromWebView.opaque = NO ;
    [super viewDidLoad];
}
-(void)setdataMusic:(NSData	*)data
{
	self.musicData=data;
	player=[[AVAudioPlayer alloc]initWithData:musicData error:nil];

	

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
		[activity release];
	[player         release];
	[toTextView		release];
	[fromLabel		release];
	[titleLabel		release];
	[fromWebView	release];
    [super dealloc];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
if (alertView.tag==1001) {
	
	[self LookRevert];
	toTextView.text=@"";
}
}
#pragma mark -
#pragma mark UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    // called when 'return' key pressed. return NO to ignore.
	
	[textField resignFirstResponder];
	return YES;
}
#pragma mark -
#pragma mark UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
	[self.view setFrame:CGRectMake(0, -160, 320, 460)];
	return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
	[self.view setFrame:CGRectMake(0, 0, 320, 460)];
	return YES;
}
#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
	NSLog(@"alslslslHUD: %@", hud);
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    [HUD release];
}
@end
