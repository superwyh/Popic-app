//
//  PostPosts.h
//  PostBar
//
//  Created by chen on 5/26/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailImage.h"
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>
#import "TopicView.h"
#import "MBProgressHUD.h"
#import <AVFoundation/AVFoundation.h>
@interface PostPosts : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,MPMediaPickerControllerDelegate,UIAlertViewDelegate,AVAudioRecorderDelegate,MBProgressHUDDelegate> {
	IBOutlet UITextField		*titleTextField;
	IBOutlet UITextView			*contextTextView;
	UIImagePickerController		*pickController;
				DetailImage		* detailImageViewController;
					UIImage		*tempImage;
				int picORcam;
				int m_tUid;
				int m_tid;
			NSMutableArray		*m_arrayYinYue;
	MPMusicPlayerController		*musicPlay;
	
	TopicView	*m_topicView ;
	AVAudioRecorder *recorder;
	AVAudioPlayer   *player;
	MBProgressHUD   *HUD;
}
@property(nonatomic,retain)UITextField		*titleTextField;
@property(nonatomic,retain)UITextView			*contextTextView;
@property (nonatomic , retain) TopicView	*m_topicView ;


-(IBAction)bigHiddenButton:(id)sender;
-(IBAction)back;
-(IBAction)mediaTouchButton;
-(IBAction)cameTouchButton;
-(IBAction)musicTouchButton;
-(IBAction)PostPosts;
-(void)setTidUid:(int)tid ;
-(void)deleteButton;



@property (nonatomic,retain)NSMutableArray *m_arrayYinYue;
@property (nonatomic,retain)UIImage   *tempImage;
@property (nonatomic,retain)DetailImage *detailImageViewController;
@property (nonatomic,retain)UIImagePickerController *	pickController;
@property (nonatomic)int m_tUid;
@property (nonatomic)int m_tid;
@end
