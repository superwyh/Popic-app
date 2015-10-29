//
//  Change.m
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "Change.h"
#import "TableViewCell.h"
#import "PostBar_Model.h"
@implementation Change
@synthesize delegate;
@synthesize m_tableViewTopic;
@synthesize m_tableViewPost;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	Tname=[[NSMutableArray alloc]init];
	Pfrom=[[NSMutableArray alloc]init];
	//Pcontent=[[NSMutableArray alloc]init];
	Pname=[[NSMutableArray alloc]init];
	//Darray=[[NSMutableArray alloc]init];
	//m_arrTid=[[NSMutableArray alloc]init];
	m_pid	=[[NSMutableArray alloc]init];
	//m_Tuid	=[[NSMutableArray alloc]init];
	//m_uid	=[[NSMutableArray alloc]init];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark myAction
-(void)loadTopic{

	NSDictionary *results=[[PostBar_Model ShareObjects]getChangeTopic];
	if (results) {
		Tname=[results objectForKey:@"tname"];
		m_arrTid=[results objectForKey:@"tid"];
	}else {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" 
													 message:@"Times Out,please cheak your network" 
													delegate:self
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	[m_tableViewPost reloadData];

}
-(void)loadPosts{
	NSDictionary *results=[[PostBar_Model ShareObjects]getChangePost];
	if (results) {
		Pname=[results objectForKey:@"Pname"];
		m_pid=[results objectForKey:@"Pid"];
	}else {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" 
											   message:@"Times Out,please cheak your network" 
											   delegate:self
											   cancelButtonTitle:@"OK"
											   otherButtonTitles:nil];
									[alert show];
									[alert release];
	}
	[m_tableViewTopic reloadData];
	
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
	[m_pid		release];
	[m_arrTid	release];
	[Tname		release];
	[Pname		release];

    [super dealloc];
}

#pragma mark -
#pragma mark UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	switch (tableView.tag) {
		case 1:
			if ([Tname count] > 5) {
				return [Tname count] ;
			} else {
				return 5 ;
			}
			
			break;
		case 2:
			if ([Pname count] > 5) {
				return [Pname count] ;
			} else {
				return 5 ;
			}
			break;
		default:
			return 0;
			break;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *PresidentCellIdentifier=@"PresidentCellIdentifier";
	TableViewCell *cell=(TableViewCell *)[tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
	if (cell==nil) {
		cell=[[[TableViewCell alloc]initWithFrame:CGRectZero reuseIdentifier:PresidentCellIdentifier]autorelease];
		cell.textLabel.font=[UIFont fontWithName:@"Georgia" size:14];
	}
	
	cell.selectionStyle=UITableViewCellSelectionStyleBlue;
	cell.delegate=self;
	switch (tableView.tag) {
		case 1:
			if (indexPath.row < [Tname count]) {
				[[cell textLabel]setText:[Tname objectAtIndex:indexPath.row]];
			}else {
				[[cell textLabel]setText:@""];
			}
			break;
		case 2:
			if (indexPath.row < [Pname count]) {
				[[cell textLabel]setText:[Pname objectAtIndex:indexPath.row]];
			}else {
				[[cell textLabel]setText:@""];
			}
			break;
			
		default:
			break;
	}
	[[cell textLabel]setTextColor:[UIColor whiteColor]];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	switch (tableView.tag) {
		case 1:{
			if (indexPath.row<[Tname count]) {
			NSString *topicname=[Tname objectAtIndex:indexPath.row];
			int     tid=[[m_arrTid objectAtIndex:indexPath.row] intValue];
			//int     uid=[[m_Tuid  objectAtIndex:indexPath.row]intValue];

			[delegate loadTopic:topicname Tid:tid];
			}
			break;
		}
		case 2:{
			if (indexPath.row<[Pname count]) {
			//NSString *postscontent=[Pcontent objectAtIndex:indexPath.row];
			//NSString *fromLabel=[Pfrom objectAtIndex:indexPath.row];
			NSString *titleLabel=[Pname objectAtIndex:indexPath.row];
			//int    uid			=[[m_uid objectAtIndex:indexPath.row] intValue];
			int    pid			=[[m_pid objectAtIndex:indexPath.row] intValue];

			[delegate loadPosts:titleLabel Pid:pid ];
			}
			break;
		}
			
		default:
			break;
	}
	[activityView setHidden:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 25;
}
#pragma mark -
#pragma mark controllerDelegate
-(void)swipeLeft{
	[delegate swipeLeft];
}
-(void)swipeRight{
	[delegate swipeRight];
}
@end
