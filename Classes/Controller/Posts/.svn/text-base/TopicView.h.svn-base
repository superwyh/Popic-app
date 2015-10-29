//
//  TopicView.h
//  PostBar
//
//  Created by chen on 5/27/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Search.h"
#import "controllerDelegate.h"
@class PostPosts;
@interface TopicView : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    id<controllerDelegate>delegate;
	IBOutlet UILabel *titleLabel;
	Search *searchViewController;
	int				m_tid;
	int				m_tUid;
	
		NSMutableArray	*Pcontent;
		NSMutableArray	*Pfrom;
		NSMutableArray	*Pname;
		NSMutableArray  *m_pid;	
		NSMutableArray  *m_uid;
		NSMutableArray	*PnameArr;
IBOutlet UITableView	*m_tableView;
		PostPosts		*postPostsViewController;
	IBOutlet	UIActivityIndicatorView *activityWait;
}
@property(nonatomic,retain)NSMutableArray	*PnameArr;
@property(nonatomic,assign)	id<controllerDelegate> delegate;
@property(nonatomic,retain)NSMutableArray	*Pname;
@property(nonatomic,retain)NSMutableArray  *m_pid;
@property(nonatomic,retain)Search *searchViewController;
@property(nonatomic,retain) IBOutlet UILabel *titleLabel;
@property(nonatomic,retain) PostPosts *postPostsViewController;
@property(nonatomic)int m_tid;
@property(nonatomic)int m_tUid;
@property(nonatomic,retain)UITableView *m_tableView;
-(IBAction)backTouchButton;
-(void)loadPosts :(int)tid  ;
-(IBAction)postTouchButton;
-(IBAction)saveTopic;
-(void)AddObjectInArray:(int)tid;
@end
