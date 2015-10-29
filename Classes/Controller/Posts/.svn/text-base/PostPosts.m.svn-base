//
//  PostPosts.m
//  PostBar
//
//  Created by chen on 5/26/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "PostPosts.h"
#import "DetailImage.h"
#import "ASIHttpHeaders.h"
#import "ServerConfig.h"
#import "PostBar_Model.h"
@implementation PostPosts
@synthesize titleTextField;
@synthesize contextTextView;
@synthesize m_arrayYinYue;
@synthesize pickController;
@synthesize  detailImageViewController;
@synthesize  tempImage;
@synthesize	 m_tUid;
@synthesize  m_tid;

@synthesize  m_topicView ;

-(IBAction)bigHiddenButton:(id)sender{
	[titleTextField resignFirstResponder];
	[contextTextView resignFirstResponder];
}
-(IBAction)back{
	[self.view removeFromSuperview];
}
-(void)setTidUid:(int)tid
{
	self.m_tid=tid;
//	self.m_tUid=tUid;
}
-(IBAction)PostPosts{
	if ([titleTextField.text isEqualToString:@""]) {
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"You don't want to say something?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}else {
		[titleTextField resignFirstResponder];
		[contextTextView resignFirstResponder];
		// The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
		HUD = [[MBProgressHUD alloc] initWithView:self.view];
		
		// Add HUD to screen
		[self.view addSubview:HUD];
		
		// Regisete for HUD callbacks so we can remove it from the window at the right time
		HUD.delegate = self;
		
		HUD.labelText = @"Loading...";
		
		// Show the HUD while the provided method executes in a new thread
		[HUD showWhileExecuting:@selector(PostPostsHUD) onTarget:self withObject:nil animated:YES];
		
	}

}
-(IBAction)PostPostsHUD
{
	//初始化Documents路径
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
	//设置ZIP文件路径
	NSString *zipPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"chen.aif"]];
	NSURL    *url  = [NSURL fileURLWithPath:zipPath];
	

	NSData	 *dataMusic=[NSData dataWithContentsOfURL:url];
	NSData   *data = UIImageJPEGRepresentation(tempImage,0.00001);
    
	
	
    
	NSString *result=[[PostBar_Model ShareObjects]PostPosts:m_tid PostName:titleTextField.text PostContent:contextTextView.text DataImage:data DataMusic:dataMusic];

	if ([result isEqualToString:@"add success！"]) {
		[m_topicView AddObjectInArray:m_tid];
			NSFileManager *fileManager = [NSFileManager defaultManager];
		//判断ZIP文件是否存在
		if ([fileManager fileExistsAtPath:zipPath]) {
			//如果存在就删除
			[fileManager removeItemAtPath:zipPath error:nil];
			UIButton *musicButton = (UIButton *)[self.view viewWithTag:50];
			[musicButton removeFromSuperview];
			}
			if (tempImage) {
				self.tempImage=nil;
			}
		

		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"success!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		alert.tag=102;
		[alert show];
		[alert release];
  
	
	
	}else if ([result isEqualToString:@"400"]) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"post faile"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		alert.tag=103;
		[alert show];
		[alert release];
	}
	else
	{
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"Times out"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		alert.tag=103;
		[alert show];
		[alert release];
	}
  	
}
-(IBAction)cameTouchButton{
	picORcam=2;
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		if (pickController==nil) {
			self.pickController=[[UIImagePickerController alloc] init];
		}
		pickController.delegate=self;
		pickController.allowsEditing=YES;
		pickController.sourceType=UIImagePickerControllerSourceTypeCamera;
		[self presentModalViewController:pickController animated:YES];
	}else {
		UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Device does not support camera" delegate:nil cancelButtonTitle:@"Drat!" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
}
-(IBAction)mediaTouchButton{
	picORcam=1;
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		if (pickController==nil) {
			self.pickController=[[UIImagePickerController alloc]init];
		}
	    pickController.delegate=self;	
		pickController.allowsEditing=YES;
		pickController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentModalViewController:pickController animated:YES];
    }
}
-(IBAction)musicTouchButton{
	UIActionSheet *  actionSheet=[[UIActionSheet alloc] initWithTitle:@"Choose the music source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Record music",/*@"From music library",*/nil];
	[actionSheet setTag:2];
	[actionSheet showInView:self.view];
	[actionSheet release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSMutableArray *_m_arrayYinYue = [[NSMutableArray alloc]init];
	self.m_arrayYinYue    = _m_arrayYinYue;
	[_m_arrayYinYue release];
}



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
    [titleTextField  release];
	[contextTextView release];
	[tempImage		 release];
	[detailImageViewController release];
	[pickController  release];
    [super dealloc];
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{

//}
#pragma mark -
#pragma mark myAction

-(void)detailImageTouchButton{
	UIActionSheet * detailButton=[[UIActionSheet alloc] initWithTitle:@"Detail" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Look over",@"Delete",nil];
	[detailButton setTag:1];
	[detailButton showInView:self.view];
	[detailButton release];
}
-(void)deleteButton{
	UIButton *willDeleteButton=(UIButton *)[self.view viewWithTag:10];
	[willDeleteButton removeFromSuperview];

	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
	
	//设置ZIP文件路径
	NSString *zipPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"chen.aif"]];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	//判断ZIP文件是否存在
	if ([fileManager fileExistsAtPath:zipPath]) {
		//如果存在就删除
		[fileManager removeItemAtPath:zipPath error:nil];
		UIButton *musicButton = (UIButton *)[self.view viewWithTag:50];
		[musicButton removeFromSuperview];
	}
	if (tempImage) {
		self.tempImage=nil;
	}
}
-(void)lookOverTouchButton{

	if (detailImageViewController==nil) {
		DetailImage *detailImageController=[[DetailImage alloc]initWithNibName:@"DetailImage" bundle:nil];
	    self.detailImageViewController=detailImageController;
	    [detailImageController release];
	}
	
	detailImageViewController.detailContextImage=tempImage;
	[detailImageViewController flushContent];
	
	CATransition *animation = [CATransition animation];
    animation.duration = 0.5f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.fillMode = kCAFillModeForwards;
	animation.type = kCATransitionPush;
	animation.subtype = kCATransitionFromBottom;
	[self.view.layer addAnimation:animation forKey:@"animation"];
    [self.view addSubview:detailImageViewController.view];

}
-(void)record{
	//初始化Documents路径
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
	//设置ZIP文件路径
	NSString *zipPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"chen.aif"]];

	NSURL    *url  = [NSURL fileURLWithPath:zipPath];
	
	recorder = [[AVAudioRecorder alloc] initWithURL:url settings:nil error:nil];
	if (!recorder.recording) {
		[recorder record];
	}else {
		[recorder pause];
	}
	UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Recorder" message:@"The choices of recorder" delegate:self cancelButtonTitle:@"stop recorder" otherButtonTitles:nil];
	alertView.tag=108;
	[alertView show];
	[alertView release];

	
}
-(void)frommusic{
	MPMediaPickerController *picker =[[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
	
	picker.delegate						= self;
	picker.allowsPickingMultipleItems	= NO;
	picker.prompt						= NSLocalizedString (@"AddSongsPrompt", @"Prompt to user to choose some songs to play");
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault animated:YES];
	
	[self presentModalViewController: picker animated: YES];
	[picker release];
}
-(void)detailMusicTouchButton{
	UIActionSheet * detailButton=[[UIActionSheet alloc] initWithTitle:@"Detail" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Play",@"Delete",nil];
	[detailButton setTag:3];
	[detailButton showInView:self.view];
	[detailButton release];
}
-(void)playMusic{
	MPMediaItemCollection *_mediaCollection = [[MPMediaItemCollection alloc]initWithItems:m_arrayYinYue];
	
	musicPlay=[MPMusicPlayerController applicationMusicPlayer];
	[musicPlay setQueueWithItemCollection:_mediaCollection];
	[musicPlay setRepeatMode:MPMusicRepeatModeAll];
	[musicPlay play];
	
	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Controller"
												 message:@"Pressed the button for stopping the music"
												delegate:self
									   cancelButtonTitle:nil
									   otherButtonTitles:@"Stop",nil];
	alert.tag=1;
	[alert show];
	[alert release];
}
-(void)deleteMusic{
	UIButton *willDeleteButton=(UIButton *)[self.view viewWithTag:5];
	[willDeleteButton removeFromSuperview];
	[m_arrayYinYue removeAllObjects];
}
-(void)musicPlayORPause	{
	if (!player.playing) {
		[player play];
	}else {
		[player stop];
	}
}

#pragma mark -
#pragma mark UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    // called when 'return' key pressed. return NO to ignore.

	[textField resignFirstResponder];
	return YES;
}
#pragma mark -
#pragma mark UIImagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
	UIButton *imageButton=[[UIButton alloc] init];
	[imageButton setFrame:CGRectMake(120, 113, 50, 25)];
	if (picORcam==1) {
		[imageButton setImage:[UIImage imageNamed:@"fujianPic.png"] forState:UIControlStateNormal];
	}else {
		[imageButton setImage:[UIImage imageNamed:@"fujianzhaoxiang.png"] forState:UIControlStateNormal];
	}
    [imageButton addTarget:self action:@selector(detailImageTouchButton) forControlEvents:UIControlEventTouchUpInside];
	[imageButton setTag:10];
	[self.view addSubview:imageButton];
	[imageButton release];
    self.tempImage=image;

	[self dismissModalViewControllerAnimated:YES];
	
}

#pragma mark -
#pragma mark actionSheet
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (actionSheet.tag==1) {
		switch (buttonIndex) {
			case 0:
				[self lookOverTouchButton];
				break;
			case 1:
				[self deleteButton];
				break;
	        case 2:
				break;

			default:
				break;
		}
	}else if (actionSheet.tag==2) {
		switch (buttonIndex) {
			case 0:
				[self record];
				break;
			case 1:
		//		[self frommusic];
				break;
	        case 2:
				break;

			default:
				break;
		}
	}else if (actionSheet.tag==3) {
		switch (buttonIndex) {
			case 0:
				[self playMusic];
				break;
			case 1:
				[self deleteMusic];
				break;
	
			default:
				break;
		}
	}

}
#pragma mark -
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (alertView.tag==1) {
		switch (buttonIndex) {
			case 0:
				[musicPlay stop];
				break;
			default:
				break;
		}
	}else if (alertView.tag==102 ) {
		[self.view removeFromSuperview];
		//[topic release];
			 // [[NSNotificationCenter defaultCenter]postNotificationName:@"fresh" object:nil];
			  } 
	else if(alertView.tag==108) {
		switch (buttonIndex) {
			case 0:{
				[recorder stop];
				NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
				//设置ZIP文件路径
				NSString *zipPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"chen.aif"]];
			    NSURL    *url  = [NSURL fileURLWithPath:zipPath];
				player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
				[player play];
				
				UIButton *musicButton=[[UIButton alloc] init];
				[musicButton setFrame:CGRectMake(200, 113, 50, 25)];
				[musicButton setImage:[UIImage imageNamed:@"fujianluyin.png"] forState:UIControlStateNormal];
				[musicButton addTarget:self action:@selector(musicPlayORPause) forControlEvents:UIControlEventTouchUpInside];
				[musicButton setTag:50];
				[self.view addSubview:musicButton];
				[musicButton release];
			}
				break;

			default:
				break;
		}
	}

		
	
}

#pragma mark -
#pragma mark MPMediaPickerController
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
	UIButton *imageButton=[[UIButton alloc] init];
	[imageButton setFrame:CGRectMake(120, 113, 50, 25)];
	[imageButton setImage:[UIImage imageNamed:@"luyin.png"] forState:UIControlStateNormal];
    [imageButton addTarget:self action:@selector(detailMusicTouchButton) forControlEvents:UIControlEventTouchUpInside];
	[imageButton setTag:5];
	[self.view addSubview:imageButton];
	[imageButton release];
	
	
	
	[m_arrayYinYue removeAllObjects];
	MPMediaItem *mediaItem=(MPMediaItem *)[mediaItemCollection.items objectAtIndex:0];

	[m_arrayYinYue addObject:mediaItem] ;
	NSLog(@"%@",[mediaItem valueForProperty:MPMediaItemPropertyTitle]);
	[self dismissModalViewControllerAnimated:YES];
}
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
	[mediaPicker dismissModalViewControllerAnimated:YES];
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
