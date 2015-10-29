//
//  Setting.m
//  PostBar
//
//  Created by chen on 5/23/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "Setting.h"
#import "PostBar_Model.h"

@implementation Setting
@synthesize engineSwitch;
@synthesize resetPasswordViewController;
-(IBAction)backButton:(id)sender{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fresh" object:nil];
	[self.view removeFromSuperview];
}
-(IBAction)switchValueChanged{
		NSString *prefValue=(engineSwitch.on)? @"YES" : @"NO";
	
		//NSDictionary *defaultValue=[NSDictionary dictionaryWithObjectsAndKeys:prefValue,@"warp",nil];
		
	[[NSUserDefaults standardUserDefaults] setValue:prefValue forKey:@"warp"];
	//[[NSUserDefaults standardUserDefaults] setObject:prefValue forKey:@"warp"];
}
-(IBAction)accountTouchButton{
	if (resetPasswordViewController==nil) {
		ResetPassword *resetPasswordController=[[ResetPassword alloc]initWithNibName:@"ResetPassword" bundle:nil];
		self.resetPasswordViewController=resetPasswordController;
		[resetPasswordController release];
	}
	[resetPasswordViewController.m_newPassword.text isEqualToString:@""];
	[resetPasswordViewController.m_oldPassword.text isEqualToString:@""];
	[resetPasswordViewController.m_confirmPassword.text isEqualToString:@""];
	[self.view addSubview:resetPasswordViewController.view];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//dragImageView[0]=changeImage;
//	dragImageView[1]=weeklyImage;
//	dragImageView[2]=favouriteImage;
//	dragImageView[3]=hotImage;
	img_rect[0]=CGRectMake(126, 20, 67, 64);  
	img_rect[1]=CGRectMake(33, 124, 67, 64);
	img_rect[2]=CGRectMake(126, 124, 67, 64);
	img_rect[3]=CGRectMake(221, 124, 67, 64);
	
	start_tag = -1;
	end_tag   = -1;
	[self refresh];
    [super viewDidLoad];
	
	NSString *username=[[PostBar_Model	ShareObjects]getUname];
	if ([username isEqualToString:@""]) {
		AccountButton.hidden=YES;
	}else {
		AccountButton.hidden=NO;
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[resetPasswordViewController release];
	[engineSwitch release];
    [super dealloc];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch=[touches anyObject];
	CGPoint point=[touch locationInView:self.view];
	
	for (int i=0; i<4; i++) {
		if(CGRectContainsPoint(img_rect[i], point))
			start_tag=i;
	}
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch=[touches anyObject];
	CGPoint point=[touch locationInView:self.view];
	
	switch (start_tag) {
		case 0:
		{
			[dragImageView[0] setFrame:CGRectMake(point.x-67/2, point.y-32, 67, 64)];
		}
			
			break;
		case 1:
		{
			[dragImageView[1] setFrame:CGRectMake(point.x-67/2, point.y-32, 67, 64)];
		}
			break;
		case 2:
		{
			[dragImageView[2] setFrame:CGRectMake(point.x-67/2, point.y-32, 67, 64)];
		}
			break;
		case 3:
		{
			[dragImageView[3] setFrame:CGRectMake(point.x-67/2, point.y-32, 67, 64)];
		}
			
			break;
	}
	
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch=[touches anyObject];
	CGPoint point =[touch locationInView:self.view];
	if(start_tag>=0 &&start_tag<=3)
	{
		for (int i=0; i<4; i++) {
			if(CGRectContainsPoint(img_rect[i], point))
				end_tag=i;
		}
		if ((end_tag==-1 && start_tag !=-1) || start_tag==end_tag) {
			[dragImageView[start_tag] setFrame:img_rect[start_tag]];
		}else {
			CGRect middle_rect =img_rect[end_tag];
			UIImageView *middleview=dragImageView[end_tag];
			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:0.5];
			[dragImageView[end_tag] setFrame:img_rect[start_tag]];
			[dragImageView[start_tag] setFrame:middle_rect];
			[UIView commitAnimations];
			dragImageView[end_tag] =dragImageView[start_tag];
			dragImageView[start_tag] =middleview;

		}
		int FavouriteExtend = [[[NSUserDefaults standardUserDefaults] objectForKey:@"fav"] intValue];
		int HotExtend		= [[[NSUserDefaults standardUserDefaults] objectForKey:@"hot"] intValue];
		int ChangeExtend	= [[[NSUserDefaults standardUserDefaults] objectForKey:@"change"] intValue];
		int WeeklyExtend	= [[[NSUserDefaults standardUserDefaults] objectForKey:@"weekly"] intValue];
		int xxx;
		if (start_tag!=-1&&end_tag!=-1) {

			
			if (start_tag==HotExtend){ 
				if (end_tag==WeeklyExtend) {
					xxx=HotExtend;
					HotExtend=WeeklyExtend;
					WeeklyExtend=xxx;
				}else if (end_tag==FavouriteExtend) {
					xxx=HotExtend;
					HotExtend=FavouriteExtend;
					FavouriteExtend=xxx;
				}else if (end_tag==ChangeExtend) {
					xxx=HotExtend;
					HotExtend=ChangeExtend;
					ChangeExtend=xxx;
				}
				
			}else if(start_tag==WeeklyExtend){
				if (end_tag==HotExtend) {
					xxx=WeeklyExtend;
					WeeklyExtend=HotExtend;
					HotExtend=xxx;
				}else if (end_tag==FavouriteExtend) {
					xxx=WeeklyExtend;
					WeeklyExtend=FavouriteExtend;
					FavouriteExtend=xxx;
				}else if (end_tag==ChangeExtend) {
					xxx=WeeklyExtend;
					WeeklyExtend=ChangeExtend;
					ChangeExtend=xxx;
				}
				
			}
			else if(start_tag==FavouriteExtend){
				if (end_tag==WeeklyExtend) {
					xxx=FavouriteExtend;
					FavouriteExtend=WeeklyExtend;
					WeeklyExtend=xxx;
				}else if (end_tag==HotExtend) {
					xxx=FavouriteExtend;
					FavouriteExtend=HotExtend;
					HotExtend=xxx;
				}else if (end_tag==ChangeExtend) {
					xxx=FavouriteExtend;
					FavouriteExtend=ChangeExtend;
					ChangeExtend=xxx;
				}
			}
			
			else if(start_tag==ChangeExtend){
				if (end_tag==WeeklyExtend) {
					xxx=ChangeExtend;
					ChangeExtend=WeeklyExtend;
					WeeklyExtend=xxx;
				}else if (end_tag==FavouriteExtend) {
					xxx=ChangeExtend;
					ChangeExtend=FavouriteExtend;
					FavouriteExtend=xxx;
				}else if (end_tag==HotExtend) {
					xxx=ChangeExtend;
					ChangeExtend=HotExtend;
					HotExtend=xxx;
				}
			}
			[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:FavouriteExtend] forKey:@"fav"];
			[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt: HotExtend] forKey:@"hot"];
			[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt: ChangeExtend] forKey:@"change"];
			[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt: WeeklyExtend] forKey:@"weekly"];
			[[NSUserDefaults standardUserDefaults] synchronize];
			
		}


	}

	start_tag=-1;
	end_tag=-1;
	
}
#pragma mark -
#pragma mark myAction
-(void)refresh{
	
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	engineSwitch.on=([[defaults objectForKey:@"warp"] isEqualToString:@"YES"])? YES:NO;
    
	int iFav = [[[NSUserDefaults standardUserDefaults] objectForKey:@"fav"] intValue];
	int iHot = [[[NSUserDefaults standardUserDefaults] objectForKey:@"hot"] intValue];
	int iCha = [[[NSUserDefaults standardUserDefaults] objectForKey:@"change"] intValue];
	int iWee = [[[NSUserDefaults standardUserDefaults] objectForKey:@"weekly"] intValue];

	for (int i=0; i<4; i++) {
		if (iCha==i) {
			[changeImage setFrame:img_rect[i]];
			dragImageView[i]=changeImage;		
		}else  if (iFav==i) {
			[favouriteImage setFrame:img_rect[i]];
			dragImageView[i]=favouriteImage;
		}else if (iHot==i) {
	        [hotImage setFrame:img_rect[i]];
			dragImageView[i]=hotImage;
		}else if (iWee==i) {
			[weeklyImage setFrame:img_rect[i]];
			dragImageView[i]=weeklyImage;
		}

	}
}
@end
