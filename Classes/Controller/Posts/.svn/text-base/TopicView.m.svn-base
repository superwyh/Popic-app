//
//  TopicView.m
//  PostBar
//
//  Created by chen on 5/27/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "TopicView.h"
#import "JSON.h"
#import "PostPosts.h"
#import "ServerConfig.h"
#import "PostBar_Model.h"
@implementation TopicView
@synthesize 	titleLabel;
@synthesize searchViewController;
@synthesize delegate;
@synthesize m_tid;
@synthesize m_tUid;
@synthesize postPostsViewController;
@synthesize m_tableView;
@synthesize Pname;
@synthesize PnameArr;
@synthesize m_pid;
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
	[Pname	  removeAllObjects];
	[m_pid	  removeAllObjects];
	
	m_tid=-1;
	[self.view removeFromSuperview];
}
-(void)AddObjectInArray:(int)tid
{
	NSDictionary *results = [[PostBar_Model ShareObjects]TopicView:tid];
	[Pname removeAllObjects];
	[m_pid removeAllObjects];
	if (results) {
		for (NSDictionary *data in results) {
			NSString *pname=[data objectForKey:@"pname"];
			NSString *pid=[data objectForKey:@"pid"];
			
			[Pname		addObject:pname];
			[m_pid		addObject:pid];
		}
	}

		[m_tableView reloadData];
}
-(IBAction)postTouchButton{
	if (postPostsViewController==nil) {
		PostPosts *postPostsController=[[PostPosts alloc]initWithNibName:@"PostPosts" bundle:nil];
		self.postPostsViewController=postPostsController;
		self.postPostsViewController.m_topicView = self ;
		[postPostsController release];
	}
	[postPostsViewController setTidUid:self.m_tid ];
	[self.view addSubview:postPostsViewController.view];
//	if (!([postPostsViewController.titleTextField.text isEqualToString:@""])) {
	
		postPostsViewController.titleTextField.text=@"";
		postPostsViewController.contextTextView.text=@"";
		[postPostsViewController deleteButton];
//	}
	
}
-(IBAction)saveTopic
{
//	NSString *post =[NSString	stringWithFormat:@"tid=%d&uid=%d",m_tid,m_tUid];  
//	
//	NSData *postData=[post dataUsingEncoding:NSUTF8StringEncoding];
//	NSString *strUrl = [ServerRoot stringByAppendingFormat:@"/servlet/TopicServlet?op=updatesave&"] ;
//	NSMutableURLRequest *connectionRequest = [NSMutableURLRequest 
//											  requestWithURL:[NSURL URLWithString:strUrl]];
//	[connectionRequest setHTTPMethod:@"POST"];
//	[connectionRequest setTimeoutInterval:100.0];
//	[connectionRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
//	[connectionRequest setHTTPBody:postData];
//	NSData *data=[NSURLConnection sendSynchronousRequest:connectionRequest returningResponse:nil error:nil];
//	NSString *stringdata=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];    

	NSString *stringdata=[[PostBar_Model ShareObjects] SaveTopic:m_tid];
	if ([stringdata isEqualToString:@"success!"]) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"This topic has been added to your favorite!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
	
		[alert show];
		[alert release];
		//[[NSNotificationCenter defaultCenter]postNotificationName:@"refresh" object:nil];
	}else if ([stringdata isEqualToString:@"Already added!"]) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
													 message:@"This topic has been Already added"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}

	else
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
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	if (searchViewController == nil) 
	{
		Search *searchController = [[Search alloc]initWithNibName:@"Search" bundle:nil];
		self.searchViewController = searchController;
		[searchController release];
	}
	
	[searchViewController.view setFrame:CGRectMake(15, 28, 290, 65)];
	[self.view addSubview:searchViewController.view];
	
	
	//Pfrom	=[[NSMutableArray alloc]init];
	//Pcontent=[[NSMutableArray alloc]init];
	Pname	=[[NSMutableArray alloc]init];
	m_pid	=[[NSMutableArray alloc]init];
	//m_uid	=[[NSMutableArray alloc]init];
	
	
	
	[super viewDidLoad];
}
-(void)loadPosts :(int)tid 
{
	
	self.m_tid=tid;

	
//	NSString *urlString = [ServerRoot stringByAppendingFormat:@"/servlet/PostsServlet?op=getPostById&tid=%d",tid] ;	
//	//NSString *urlString=[NSString stringWithFormat:@"http://192.168.1.14:8080/PostBar/servlet/PostsServlet?op=getPostById&tid=%d",tid];
//	

	NSDictionary *results = [[PostBar_Model ShareObjects]TopicView:tid];

	

		for (NSDictionary *data in results) {
			NSString *pname=[data objectForKey:@"pname"];
			NSString *pid=[data objectForKey:@"pid"];
		
			[Pname		addObject:pname];
			[m_pid		addObject:pid];
			}
			[m_tableView reloadData];
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
	
	[m_pid		release];
	[m_uid		release];
	[titleLabel release];
	[Pname		release];
	[Pcontent	release];
	[Pfrom		release];
    [searchViewController	 release];
	[postPostsViewController release];
	[super dealloc];
}

#pragma mark -
#pragma mark UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [Pname count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *PresidentCellIdentifier=@"PresidentCellIdentifier";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
	if (cell==nil) {
		cell=[[[UITableViewCell alloc]initWithFrame:CGRectZero reuseIdentifier:PresidentCellIdentifier]autorelease];
		cell.textLabel.font=[UIFont fontWithName:@"Georgia" size:14];
		
	}
	cell.selectionStyle=UITableViewCellSelectionStyleBlue;

	
	[[cell textLabel]setText:[Pname objectAtIndex:indexPath.row]];
    [[cell textLabel]setTextColor:[UIColor whiteColor]];
	return cell;
}
-(void)waitHUD{
	[activityWait setHidden:NO];
	[activityWait startAnimating];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	[NSThread detachNewThreadSelector:@selector(waitHUD) toTarget:self withObject:nil];
	NSString *nextLabel=[Pname objectAtIndex:indexPath.row];
	int		 pid	   =[[m_pid objectAtIndex:indexPath.row] intValue];

	[delegate loadPosts:nextLabel Pid:pid];
	[activityWait stopAnimating];
	[activityWait setHidden:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 30;
}
@end
