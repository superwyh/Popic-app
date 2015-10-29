//
//  PostBarAppDelegate.h
//  PostBar
//
//

#import <UIKit/UIKit.h>

@class PostBarViewController;

@interface PostBarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PostBarViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PostBarViewController *viewController;

@end

