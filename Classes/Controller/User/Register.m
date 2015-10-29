//
//  Register.m
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "Register.h"
#import "PostBar_Model.h"
@implementation Register
-(void)viewDidLoad
{
	[super viewDidLoad];
}
-(IBAction)cancelTouchButton:(id)sender{
	[m_userName.text isEqualToString:@""];
	[m_userPassword.text isEqualToString:@""];
	[m_confirmPassword.text isEqualToString:@""];
	[m_email.text isEqualToString:@""];
	[self.view removeFromSuperview];
}
-(BOOL) validateEmail: (NSString *) candidate {
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
	
	return [emailTest evaluateWithObject:candidate];
}
-(IBAction)submit {
	// The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	
    // Add HUD to screen
    [self.view addSubview:HUD];
	
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
	
    HUD.labelText = @"Loading...";
	
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(submitHUD) onTarget:self withObject:nil animated:YES];
}

- (IBAction) submitHUD{
	if ([m_userName.text isEqualToString:@""] || [m_userPassword.text isEqualToString:@"" ] || [m_confirmPassword.text isEqualToString:@""] || [m_email.text isEqualToString:@""] )
	{
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													message:@"Text Can't Empty!"
													delegate:self
											cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}
	else 
	{
		if ([m_userPassword.text isEqualToString:m_confirmPassword.text] && m_userPassword.text.length >5 ) {
			if([self validateEmail:m_email.text]==NO)
			{
				UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
															 message:@"email format was wrong!"
															delegate:self
												   cancelButtonTitle:@"OK" 
												   otherButtonTitles:nil];
				[alert show];
				[alert release];
				
			}else {
				NSString *stringdata=[[PostBar_Model ShareObjects]RegisterUser:m_userName.text Password:m_userPassword.text EMail:m_email.text];
				
				if ([stringdata isEqualToString:@"Add success!"]) {
					UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Notice" 
																  message:@"Success！"
																 delegate:self
														cancelButtonTitle:@"OK" 
														otherButtonTitles:nil];
					alert1.tag=101;
					[alert1 show];
					[alert1 release];
			}else if([stringdata isEqualToString:@"Login failed!"]) {
				UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
															 message:@"UserName was exist"
															delegate:self
												   cancelButtonTitle:@"OK" 
												   otherButtonTitles:nil];
				[alert show];
				[alert release];
			}


			
		}
	
		}
		else
		{	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
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
	if (alertView.tag==101) {
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
	[m_userName			release];
	[m_userPassword		release];
	[m_confirmPassword	release];
	[m_email			release];
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
			[self.view setFrame:CGRectMake(0, -20, 320, 460)];
			break;
		case 3:
			[self.view setFrame:CGRectMake(0, -90, 320, 460)];
			break;
	    case 4:
			[self.view setFrame:CGRectMake(0, -90, 320, 460)];
			break;

		default:
			break;
	}
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
