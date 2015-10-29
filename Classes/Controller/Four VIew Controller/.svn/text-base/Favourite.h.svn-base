//
//  Favourite.h
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "controllerDelegate.h"
@interface Favourite : UIViewController <UITableViewDelegate,UITableViewDataSource,controllerDelegate>{
	id<controllerDelegate> delegate;
			int				intuid;
			NSMutableArray *Tname;
			NSMutableArray *Pcontent;
			NSMutableArray *Pfrom;
			NSMutableArray *Darray;
			NSMutableArray *Pname;
			NSMutableArray *m_arrTid;
			NSMutableArray *m_pid;
			NSMutableArray *m_Tuid;//帖子的拥有者
			NSMutableArray *m_uid;
IBOutlet	UITableView    *m_tableViewTopic;
IBOutlet	UITableView    *m_tableViewPost;
			int				m_nullNumPost;
			int				m_nullNumTopic;
}
@property (nonatomic,retain)UITableView *m_tableViewPost;
@property (nonatomic,retain)UITableView *m_tableViewTopic;
@property(nonatomic)		int	intuid;
@property(nonatomic)		int m_nullNumPost;
@property(nonatomic)		int m_nullNumTopic;
@property(nonatomic,assign)	id<controllerDelegate> delegate;
-(void)loadTopic:(int)uid;
-(void)loadPosts:(int)uid;


@end
