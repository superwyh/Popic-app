//
//  Setting.h
//  PostBar
//
//  Created by chen on 5/23/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResetPassword.h"

@interface Setting : UIViewController {
	IBOutlet UISwitch * engineSwitch;
	
	IBOutlet UIImageView *changeImage;
	IBOutlet UIImageView *weeklyImage;
	IBOutlet UIImageView *favouriteImage;
	IBOutlet UIImageView *hotImage;
	
	UIImageView *dragImageView[4];
	IBOutlet UIButton    *AccountButton;
	int start_tag,end_tag;
	CGRect img_rect[4];
	ResetPassword *resetPasswordViewController;
}
@property (nonatomic,retain)ResetPassword * resetPasswordViewController;
@property (nonatomic,retain)UISwitch * engineSwitch;
-(IBAction)backButton:(id)sender;
-(IBAction)switchValueChanged;
-(IBAction)accountTouchButton;
-(void)refresh;
@end
