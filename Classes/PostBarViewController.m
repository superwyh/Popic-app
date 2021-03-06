//
//  PostBarViewController.m
//  PostBar
//
//

#import "PostBarViewController.h"
#import "Favourite.h"
#import "JSON.h"
#import "ServerConfig.h"

@implementation PostBarViewController
@synthesize setViewController;
@synthesize mainViewController;
@synthesize registerViewController;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
-(IBAction)facebookButton:(id)sender{
	[PostBar_Model ShareObjects].m_bIsInvite = NO ;
	[PostBar_Model ShareObjects].delegate=self;
	[[PostBar_Model ShareObjects] facebookLogin];
}
-(void) facebookLoginSuccess {
	
	m_viewWait.hidden = NO ;
	m_wait.hidden     = NO ;
	[m_wait startAnimating] ;
	[[PostBar_Model ShareObjects] fetchFacebookUser] ;
}

- (void) fetchUserSuccess  {
	m_viewWait.hidden = YES ;
	m_wait.hidden     = YES ;
	NSString *str = [[PostBar_Model ShareObjects] facebookLog2MyServer] ;
	
	NSArray *array = [str JSONValue] ;
	if (array && [array count] > 0) {
		NSDictionary *d = [array objectAtIndex:0] ;
		[PostBar_Model ShareObjects].m_uid	= [[d objectForKey:@"uid"] intValue];
		[PostBar_Model ShareObjects].m_uName= [d objectForKey:@"uname"];
	}
	
	


	if (mainViewController==nil) 
	{
		Main  *mainController=[[Main alloc]initWithNibName:@"Main" bundle:nil];
		self.mainViewController=mainController;		
		[mainController release];

	}
	[signoutButton setHidden:NO];
	[nameImageView setHidden:YES];
	[passwordImageView setHidden:YES];
	[nameTextField setHidden:YES];
	[passwordField setHidden:YES];
	mainViewController.view.alpha = 0 ;
	[self.view addSubview:mainViewController.view];	
	
	[UIView beginAnimations:@"animationID" context:nil];
	[UIView setAnimationDuration:1.0f];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	[UIView setAnimationRepeatAutoreverses:NO];
	mainViewController.view.alpha = 1 ;
	//[[NSUserDefaults standardUserDefaults] setObject:nameTextField.text forKey:@"userName"];
	
	[UIView commitAnimations];
		
}
-(IBAction)signupButton:(id)sender{
	if (registerViewController==nil) {
		Register *registerController=[[Register alloc]initWithNibName:@"Register" bundle:nil];
		self.registerViewController=registerController;
		[registerController release];
	
	}
    [self.view addSubview:registerViewController.view];
	
}
-(IBAction)signoutButton:(id)sender{
	[signoutButton setHidden:YES];
	[nameImageView setHidden:NO];
	[passwordImageView setHidden:NO];
	[nameTextField setHidden:NO];
	[passwordField setHidden:NO];
	passwordField.text=nil;
	nameTextField.text=nil;
	[[PostBar_Model ShareObjects]deleteUname];
	//[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"];

}
-(IBAction)settingButton:(id)sender{
	if (setViewController==nil) {
    	Setting *setController=[[Setting alloc]initWithNibName:@"Setting" bundle:nil];
	    self.setViewController =setController;
	    [setController release];
	}
	[setViewController refresh];
	[self.view addSubview:setViewController.view];
}
-(IBAction)loginButton:(id)sender{
	// The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
	[nameTextField resignFirstResponder];
	[passwordField resignFirstResponder];
	
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	
    // Add HUD to screen
    [self.view addSubview:HUD];
	
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
	
    HUD.labelText = @"Loading...";
	
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(loginButtonHUD:) onTarget:self withObject:nil animated:YES];
}
-(void)loginButtonHUD:(id)sender{

	
	if ([nameTextField.text isEqualToString:@"username"]||[nameTextField.text isEqualToString:@""]||[passwordField.text isEqualToString:@""]) {
		UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Error" message:@"name or password cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
		
	}else{
		NSString *result=[[PostBar_Model ShareObjects] Login:nameTextField.text Password:passwordField.text];
		
		if (!result) 
		{
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error"
														 message:@"Please check your network" 
														delegate:self 
											   cancelButtonTitle:@"OK" 
											   otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
		else
		{
			if ([result isEqualToString:@"400"]) 
			{
				UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" 
															 message:@"name or password is wrong"
															delegate:self
												   cancelButtonTitle:@"OK" 
												   otherButtonTitles:nil];
				[alert show];
				[alert release];
			}
			else 
			{
				if (mainViewController==nil) 
				{
					Main  *mainController=[[Main alloc]initWithNibName:@"Main" bundle:nil];
					self.mainViewController=mainController;
					[mainController release];
				}
				[signoutButton setHidden:NO];
				[nameImageView setHidden:YES];
				[passwordImageView setHidden:YES];
				[nameTextField setHidden:YES];
				[passwordField setHidden:YES];
				mainViewController.view.alpha = 0 ;
				[self.view addSubview:mainViewController.view];	
				[mainViewController fresh];
				[UIView beginAnimations:@"animationID" context:nil];
				[UIView setAnimationDuration:1.0f];
				[UIView setAnimationCurve:UIViewAnimationCurveLinear];
				[UIView setAnimationRepeatAutoreverses:NO];
				mainViewController.view.alpha = 1 ;
				//[[NSUserDefaults standardUserDefaults] setObject:nameTextField.text forKey:@"userName"];
				
				[UIView commitAnimations];
				//  [[NSUserDefaults standardUserDefaults] setObject:nameTextField.text forKey:@"userName"];
				//  [self.view addSubview:mainViewController.view];	
				
			}
		}	

	}
}
	
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(IBAction)invite {
	[PostBar_Model ShareObjects].m_bIsInvite = YES ;
	[[PostBar_Model ShareObjects] sendInviteMsg2FacebookFriends];
}


- (void)dealloc {
	[registerViewController release];
	[setViewController release];
	[mainViewController release];
    [super dealloc];
}
#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    // called when 'return' key pressed. return NO to ignore.
	[textField resignFirstResponder];
	return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	if (textField ==passwordField) {
		[passwordField setSecureTextEntry:YES];
	}
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
