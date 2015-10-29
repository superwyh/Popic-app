//
//  PostBarViewController.h
//  PostBar
//
//

#import <UIKit/UIKit.h>
#import "Setting.h"
#import "Main.h"
#import "Register.h"
#import "MBProgressHUD.h"
#import "PostBar_Model.h"
@interface PostBarViewController : UIViewController <MBProgressHUDDelegate,PostBar_ModelDelegate>{
	IBOutlet UIButton *signoutButton;
	IBOutlet UIImageView *nameImageView;
	IBOutlet UIImageView *passwordImageView;
	IBOutlet UITextField *nameTextField;
	IBOutlet UITextField *passwordField;
	Setting *setViewController;
	Main    *mainViewController;
	Register *registerViewController;
	MBProgressHUD *HUD;
	IBOutlet	UIView					*m_viewWait;
	IBOutlet	UIActivityIndicatorView *m_wait ;

}
@property(nonatomic,retain)Setting *setViewController;
@property(nonatomic,retain)Main    *mainViewController;
@property(nonatomic,retain)Register *registerViewController;
-(IBAction)loginButton:(id)sender;
-(IBAction)signupButton:(id)sender;
-(IBAction)facebookButton:(id)sender;
-(IBAction)settingButton:(id)sender;
-(IBAction)signoutButton:(id)sender;
-(IBAction)invite ;
@end

