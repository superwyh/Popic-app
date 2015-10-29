//
//  LookRevert.m
//  PostBar
//
//  Created by DQ on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LookRevertController.h"
#import "LookRevertCell.h"
#import "PostBar_Model.h"
@implementation LookRevertController
@synthesize m_dic;
@synthesize m_pid;
@synthesize m_indexPath;
@synthesize m_puid;
@synthesize m_pname;
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
	[m_uname	release];
	[m_content	release];
    [super dealloc];
}
-(void)viewDidLoad
{
	m_uname		=[[NSMutableArray alloc]init];
	m_content	=[[NSMutableArray alloc]init];
	[super viewDidLoad];
}
-(IBAction)back
{
	[self.view removeFromSuperview];
}
-(void)setdic:(NSDictionary *)dic;
{
	self.m_pid  =[[dic objectForKey:@"pid"] intValue];
	self.m_puid =[[dic objectForKey:@"puid"] intValue];
	self.m_pname=[dic objectForKey:@"pname"];
	
}
-(IBAction)revertPost
{

	[m_recontent resignFirstResponder];
	if ([m_recontent.text isEqualToString:@""]) {
	 	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!" 
													 message:@"You don't wangt to say something!"
													delegate:self
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		
		[alert show];
		[alert release];
	}else {
	NSString *stringdata=[[PostBar_Model ShareObjects]RePost:m_pid Recontent:m_recontent.text Puid:m_puid Pname:m_pname];
	if ([stringdata isEqualToString:@"Reply to success!"] )
		{
			[m_uname removeAllObjects];
			[m_content removeAllObjects];
			NSArray *arr=[[PostBar_Model ShareObjects]Comments:m_pid];
			for (NSDictionary *data in arr) {
				NSString *uname		=[data objectForKey:@"uname"];
				NSString *recontent	=[data objectForKey:@"recontent"];
				self.m_pid			=[[data objectForKey:@"pid"] intValue];
				[m_uname		addObject:uname];
				[m_content		addObject:recontent];
			}
	
			[m_tableView reloadData];
			UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" 
														 message:@"success!"
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
}
-(void)setarr :(NSArray *)arr
{
	for (NSDictionary *data in arr) {
		NSString *uname		=[data objectForKey:@"uname"];
		NSString *recontent	=[data objectForKey:@"recontent"];
		self.m_pid			=[[data objectForKey:@"pid"] intValue];
		self.m_puid			=[[data objectForKey:@"uid"]intValue];
		self.m_pname		=[data objectForKey:@"pname"];
		[m_uname		addObject:uname];
		[m_content		addObject:recontent];
      }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if ([m_content count]>3) {
		
		return [m_content count];
		
	}else {
	
		return 3;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	//static NSString *PresidentCellIdentifier=@"PresidentCellIdentifier";
//	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
	LookRevertCell *cell=(LookRevertCell *)[tableView dequeueReusableCellWithIdentifier:@"PresidentCellIdentifier"];
	if (!cell) 
	{
	    NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"LookRevertCell" owner:self options:nil];
		cell=[array objectAtIndex:0];
		cell.m_Content.backgroundColor = [UIColor clearColor] ;
		cell.m_Content.opaque = NO ;
	}
	//self.m_indexPath=indexPath;
	[cell setContent:indexPath];
	cell.m_delegate=self;
	cell.selectionStyle=UITableViewCellSelectionStyleNone;
	if (indexPath.row <[m_content count]) {
		cell.m_labelFrom.text=[m_uname objectAtIndex:indexPath.row];
		NSString *content=[NSString stringWithFormat:@"<body style='color:white;font-size:12px;'>%@</body>",[m_content objectAtIndex:indexPath.row]];
		[cell.m_Content loadHTMLString:content baseURL:nil];
	}else {
		[cell.contentView removeFromSuperview];
		cell.m_labelFrom.text=@"";
	}

	
	

//	[[cell textLabel]setText:[Pname objectAtIndex:indexPath.row]];
//    [[cell textLabel]setTextColor:[UIColor whiteColor]];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 90;
}

- (IBAction)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row >= [m_content count]) {
		[m_recontent resignFirstResponder];
	}

}
-(IBAction)bigTouchButton{
	
	[m_recontent resignFirstResponder];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
	[self.view setFrame:CGRectMake(0, -160, 320, 460)];
	return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
	[self.view setFrame:CGRectMake(0, 0, 320, 460)];
	return YES;
}

- (void)getIndex:(NSIndexPath *)indexPaht
{
	//NSString *uNameFrom=[[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
	[m_recontent becomeFirstResponder];
	[self textViewShouldBeginEditing:m_recontent];
	NSString *uNameFrom=[[PostBar_Model ShareObjects]getUname];
	NSString *uNameTo  =[m_uname objectAtIndex:indexPaht.row];
    m_recontent.text=[uNameFrom stringByAppendingFormat:@"   to  %@ : ",uNameTo];
}

@end
