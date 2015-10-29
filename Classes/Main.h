//
//  Main.h
//  PostBar
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Search.h"
#import "Setting.h"
#import "Favourite.h"
#import "Weekly.h"
#import "Change.h"
#import "Hot.h"
#import "PostPosts.h"
#import "PostsView.h"
#import "MBProgressHUD.h"
@class TopicView;
@interface Main : UIViewController <MBProgressHUDDelegate, UITableViewDelegate,UITableViewDataSource,controllerDelegate,UITextFieldDelegate>{
	UIView *outtext;
	UIView *createView;
	Favourite * favouriteViewController;
	Weekly *weeklyViewController;
	Change *changeViewController;
	Hot    *hotViewController;
	Search *searchViewController;
	Setting *settingViewController;
	PostPosts *postPostsViewController;
	TopicView *topicViewController;
	PostsView *postsViewController;
	int ShowOrHide;  
	IBOutlet UIButton *leftButton;
	IBOutlet UIButton *rightButton;
	IBOutlet UIButton *upButton;
	int iFav;
	int iHot;
	int iCha;
	int iWee;
	int intUid;
	NSMutableArray *AArray;
	//NSMutableArray *m_arrUid;
	NSMutableArray *m_arrPid;
	//NSMutableArray * FromLabel;
	UITableView	   *m_tableViewOut;
	UITextField	   *m_textField;
	MBProgressHUD *HUD;
	IBOutlet UIActivityIndicatorView *activityView;

}
@property(nonatomic,retain) UIView *createView;
@property(nonatomic,retain) TopicView * topicViewController;
@property(nonatomic,retain) PostsView *postsViewController;
@property(nonatomic,retain)	Weekly *weeklyViewController;
@property(nonatomic,retain)	Change *changeViewController;
@property(nonatomic,retain) Hot   *hotViewController;
@property(nonatomic,retain) PostPosts *postPostsViewController;
@property(nonatomic,retain) Setting *settingViewController;
@property(nonatomic,retain)	Favourite * favouriteViewController;
@property(nonatomic,retain)	Search *searchViewController;
@property(nonatomic,retain) UIView *outtext;
@property(nonatomic,retain) UITableView	   *m_tableViewOut;
@property(nonatomic,retain) UITextField		*m_textField;
@property(nonatomic)int intUid;
-(IBAction)backTouchButton;
-(IBAction)histroyTouchButton;
-(IBAction)settingTouchButton;
-(IBAction)postTouchButton;
-(IBAction)leftTouchButton;
-(IBAction)rightTouchButton;
-(IBAction)upTouchButton;
-(void)fresh;
-(void)deleteView;
-(IBAction)createTopic;

@end
