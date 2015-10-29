//
//  Search.h
//  PostBar
//
//  Created by chen on 5/25/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "controllerDelegate.h"
#import "MBProgressHUD.h"
@class SearchResultController;
@interface Search : UIViewController<UITextFieldDelegate,UIAlertViewDelegate,MBProgressHUDDelegate> {
	 id<controllerDelegate>delegate;
	IBOutlet UITextField *searchTextField;
	IBOutlet UIButton	 *topicButton;
	IBOutlet UIButton	 *postsButton;
		 BOOL			  TopicOrPost;
  SearchResultController *searchResultController;
					int   m_uid;
	MBProgressHUD *HUD;

}
@property(nonatomic,assign)	id<controllerDelegate> delegate;
@property (nonatomic)int		m_uid;
@property (nonatomic,retain)SearchResultController *searchResultController;
-(void)setUid:(int)uid;
-(IBAction)goSearch;
-(IBAction)topicTouchButton:(id)sender;
-(IBAction)postsTouchButton:(id)sender;

@end
