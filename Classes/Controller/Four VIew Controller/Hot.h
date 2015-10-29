//
//  Hot.h
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "controllerDelegate.h"

@interface Hot : UIViewController <UITableViewDelegate,controllerDelegate>{
	id<controllerDelegate> delegate;
	NSMutableArray *m_arrTid;
	NSMutableArray *Tname;
	NSMutableArray *Pcontent;
	NSMutableArray *Pfrom;
	NSMutableArray *Darray;
	NSMutableArray *Pname;
	NSMutableArray *m_pid;
	NSMutableArray *m_Tuid;//帖子的拥有者
	NSMutableArray *m_uid;
	IBOutlet	UITableView *m_tableViewPost;
	IBOutlet	UITableView	*m_tableViewTopic;
}
@property (nonatomic,retain)UITableView *m_tableViewPost;
@property (nonatomic,retain)UITableView *m_tableViewTopic;
@property(nonatomic,assign)	id<controllerDelegate> delegate;
-(void)loadTopic;
-(void)loadPosts;
@end
