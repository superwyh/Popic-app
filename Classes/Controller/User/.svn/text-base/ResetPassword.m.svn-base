//
//  ResetPassword.m
//  PostBar
//
//  Created by chen on 5/27/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "ResetPassword.h"
#import "PostBar_Model.h"

@implementation ResetPassword
@synthesize m_newPassword;
@synthesize m_oldPassword;
@synthesize m_confirmPassword;
-(IBAction)cancelTouchButton{
	[self.view removeFromSuperview];
}

-(IBAction)submit
{
	if ([m_newPassword.text isEqualToString:@""] || [m_oldPassword.text isEqualToString:@""] || [m_confirmPassword.text isEqualToString:@""] ) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"Can't Empty!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		[alert show];
		[alert release];
	}else {
		if ([m_newPassword.text isEqualToString:m_confirmPassword.text] && m_newPassword.text.length>5) {
			NSString *stringdata=[[PostBar_Model ShareObjects]ResetPassword:m_oldPassword.text  Confirm:m_confirmPassword.text];
		//	NSString *urlString = [ServerRoot stringByAppendingFormat:@"/servlet/UsersServlet?op=updatepass&"] ;
//			NSString *username=[[NSUserDefaults standardUserDefaults]objectForKey:@"userName"]; 
//			NSString *post =[NSString	stringWithFormat:@"name=%@&pass=%@&npass=%@",username,m_oldPassword.text,m_confirmPassword.text];  
//			NSData *postData=[post dataUsingEncoding:NSUTF8StringEncoding];
//			NSMutableURLRequest *connectionRequest = [NSMutableURLRequest 
//													  requestWithURL:[NSURL URLWithString:urlString]];
//			[connectionRequest setHTTPMethod:@"POST"];
//			[connectionRequest setTimeoutInterval:100.0];
//			[connectionRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
//			[connectionRequest setHTTPBody:postData];
//			NSData *data=[NSURLConnection sendSynchronousRequest:connectionRequest returningResponse:nil error:nil];
//			NSString *stringdata=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];    
			
			if ([stringdata isEqualToString:@"Modify success!"]) {
				UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
															 message:@"Modify success"
															delegate:self
												   cancelButtonTitle:@"OK" 
												   otherButtonTitles:nil];
				alert.tag=201;
				[alert show];
				[alert release];
			}
		}else {
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
														 message:@"Password was't the same Or Password less than 6 bit!"
														delegate:self
											   cancelButtonTitle:@"OK" 
											   otherButtonTitles:nil];
			[alert show];
			[alert release];
		}

	}

	
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag==201) {
		[self.view removeFromSuperview];
	}
}
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
	[m_newPassword		release];
	[m_oldPassword		release];
	[m_confirmPassword	release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    // called when 'return' key pressed. return NO to ignore.
    [self.view setFrame:CGRectMake(0, 0, 320, 460)];
	[textField resignFirstResponder];
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{   // became first responder
	switch (textField.tag) {
		case 1:
			[self.view setFrame:CGRectMake(0, 0, 320, 460)];
			break;
			
		case 2:
			[self.view setFrame:CGRectMake(0, -50, 320, 460)];
			break;
		case 3:
			[self.view setFrame:CGRectMake(0, -100, 320, 460)];
			break;

		default:
			break;
	}
}
@end
