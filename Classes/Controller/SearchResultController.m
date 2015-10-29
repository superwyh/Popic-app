//
//  SearchResultController.m
//  PostBar
//
//  Created by DQ on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultController.h"
#import "TableViewCell.h"

@implementation SearchResultController
@synthesize m_dicTopic;
@synthesize m_dicPost;
@synthesize  TopicOrPosts;
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
	
	Tname=[[NSMutableArray alloc]init];
	//Pfrom=[[NSMutableArray alloc]init];
	//Pcontent=[[NSMutableArray alloc]init];
	Pname=[[NSMutableArray alloc]init];
	//m_uid=[[NSMutableArray alloc]init];
	m_tid=[[NSMutableArray alloc]init];
	m_pid	=[[NSMutableArray alloc]init];
	//m_tUid	=[[NSMutableArray alloc]init];
	
}
//-(void)viewWillAppear:(BOOL)animated
//{
//	[table reloadData];
//}
-(void)setTopicDic:(NSDictionary *)dic TopicOrPost:(BOOL)tORp
{
	self.TopicOrPosts=tORp;
	self.m_dicTopic=dic;
	for (NSDictionary *data in dic) {
		NSString *tname=[data objectForKey:@"tname"];
		NSString *tid=[data objectForKey:@"tid"];
		[Tname		addObject:tname];
		[m_tid		addObject:tid];
		
	
     }
	[table reloadData];
}
-(void)setPostDic:(NSDictionary *)dic TopicOrPost:(BOOL)tORp
{

	self.TopicOrPosts=tORp;
	self.m_dicPost=dic;
	for (NSDictionary *data in dic) {
		NSString *pname=[data objectForKey:@"pname"];
		NSString *pid=[data objectForKey:@"pid"];
		
		[Pname		addObject:pname];
		[m_pid		addObject:pid];
   }
	
	
	
	[table reloadData];
}
-(IBAction)back
{
	[self.view removeFromSuperview];
	[Tname removeAllObjects];
	[m_pid removeAllObjects];
	[m_tid removeAllObjects];
	[Pname removeAllObjects];
	
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	

	if (TopicOrPosts) {
		return [Tname count];
	}
	else if (!TopicOrPosts) 
	{
		return [Pname count];
	}
	return 0;
}
//- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	static NSString *PresidentCellIdentifier=@"PresidentCellIdentifier";
//	TableViewCell *cell=(TableViewCell *)[table dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
//	if (cell==nil) {
//		cell=[[[TableViewCell alloc]initWithFrame:CGRectZero reuseIdentifier:PresidentCellIdentifier]autorelease];
//	}
//	cell.selectionStyle=UITableViewCellSelectionStyleNone;
//	cell.delegate=self;
//	if (TopicOrPosts) {
//		[[cell textLabel]setText:[Tname objectAtIndex:indexPath.row]];
//	}else if (!TopicOrPosts) {
//		[[cell textLabel]setText:[Pname objectAtIndex:indexPath.row]];
//	}
//	
//	[[cell textLabel]setTextColor:[UIColor whiteColor]];
//	return cell;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	static NSString *PresidentCellIdentifier=@"PresidentCellIdentifier";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
	if (cell==nil) {
		cell=[[[UITableViewCell alloc]initWithFrame:CGRectZero reuseIdentifier:PresidentCellIdentifier]autorelease];
	}
	cell.selectionStyle=UITableViewCellSelectionStyleNone;
	//cell.delegate=self;
	if (TopicOrPosts) {
		[[cell textLabel]setText:[Tname objectAtIndex:indexPath.row]];
	}else if (!TopicOrPosts) {
		[[cell textLabel]setText:[Pname objectAtIndex:indexPath.row]];
	}

	[[cell textLabel]setTextColor:[UIColor whiteColor]];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (TopicOrPosts) {
	
		NSString *topicname=[Tname objectAtIndex:indexPath.row];
		int     tid=[[m_tid objectAtIndex:indexPath.row] intValue];
		[delegate loadTopic:topicname Tid:tid];
	    
	}else if (!TopicOrPosts) {	
		NSString *nextLabel=[Pname objectAtIndex:indexPath.row];
		int		 pid	   =[[m_pid objectAtIndex:indexPath.row] intValue];
		[delegate loadPosts:nextLabel Pid:pid];
	}

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
    [super dealloc];
}


@end
