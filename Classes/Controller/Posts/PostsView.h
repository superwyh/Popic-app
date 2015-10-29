//
//  PostsView.h
//  PostBar
//
//  Created by chen on 5/27/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <AVFoundation/AVFoundation.h>
@interface PostsView : UIViewController <UITextFieldDelegate,UITextViewDelegate,MBProgressHUDDelegate,UIAlertViewDelegate>{

	IBOutlet UITextView *toTextView;
	IBOutlet UIWebView	*fromWebView;
	IBOutlet UILabel    *fromLabel;
	IBOutlet UILabel    *titleLabel;
	IBOutlet UIButton	*m_buttonPic;
	IBOutlet UIButton   *m_buttonMusic;
			NSMutableArray *Pcontent;
				int		m_pid;
				int		m_Puid;
			UIImage		*m_image;
			UIView		*m_viewNew;
		
	MBProgressHUD *HUD;
	AVAudioPlayer *player;
	NSData     *musicData;
	IBOutlet UIActivityIndicatorView *activity;
				
}
@property(nonatomic,retain)	NSData	 *musicData;
@property(nonatomic,retain)UIButton  *m_buttonMusic;
@property(nonatomic,retain)UIButton	  *m_buttonPic;
@property(nonatomic,retain)UIView	  *m_viewNew;
@property(nonatomic,retain)UIImage	  *m_image;
@property(nonatomic,retain)UILabel    *fromLabel;
@property(nonatomic,retain)UILabel    *titleLabel;
@property(nonatomic,retain)UIWebView *fromWebView;
@property(nonatomic,retain)UITextView *toTextView;

@property(nonatomic)		int			m_pid;
@property(nonatomic)		int			m_Puid;
-(IBAction)back;
-(IBAction)bigTouchButton;
-(IBAction)savePosts;
-(IBAction)replayPost;
-(IBAction)LookRevert;
-(void)setPid:(int)pid	Puid:(int)Puid ;
-(IBAction)LookBigPic;
-(IBAction)playORpause;
-(void)setdataMusic:(NSData *)data;
@end
