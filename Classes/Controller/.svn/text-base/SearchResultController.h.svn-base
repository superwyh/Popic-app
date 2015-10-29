//
//  SearchResultController.h
//  PostBar
//
//  Created by DQ on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "controllerDelegate.h"

@interface SearchResultController : UIViewController <UITableViewDelegate,UITableViewDataSource,controllerDelegate>{
    id<controllerDelegate>delegate;
	NSDictionary *m_dicTopic;
	NSDictionary *m_dicPost;
	IBOutlet UITableView *table;
	NSMutableArray	*Pcontent;
	NSMutableArray	*Pfrom;
	NSMutableArray	*Pname;
	NSMutableArray  *m_pid;
	NSMutableArray	*m_uid;
	NSMutableArray	*Tname;
	NSMutableArray	*m_tid;
	NSMutableArray	*m_tUid;
	BOOL TopicOrPosts;
	 
}
@property(nonatomic,assign)	id<controllerDelegate> delegate;
@property(nonatomic,retain)NSDictionary *m_dicTopic;
@property(nonatomic,retain)NSDictionary *m_dicPost;
@property(nonatomic)BOOL          TopicOrPosts;
-(IBAction)back;
-(void)setTopicDic:(NSDictionary *)dic TopicOrPost:(BOOL)tORp;
-(void)setPostDic:(NSDictionary *)dic TopicOrPost:(BOOL)tORp;
@end
