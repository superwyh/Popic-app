//
//  PostBarAppDelegate.m
//  PostBar
//
//

#import "PostBarAppDelegate.h"
#import "PostBarViewController.h"
#import "PostBar_Model.h"
@implementation PostBarAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	//NSString *noStr=[[NSUserDefaults standardUserDefaults]valueForKey:@"warp"];
	
	//if([noStr isEqualToString:@"YES"])
	//{
	if(![[NSUserDefaults standardUserDefaults] valueForKey:@"devicetoken"]) {
		UIRemoteNotificationType romoteNotificationtType = (UIRemoteNotificationTypeAlert ) ;
		[[UIApplication sharedApplication] registerForRemoteNotificationTypes:romoteNotificationtType] ;
	}
	//}
    // Override point for customization after application launch.

	
    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

    return YES;
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	NSLog(@"deviceToken = %@" , deviceToken) ;
	NSString *strToken = [[[[deviceToken description]
							stringByReplacingOccurrencesOfString: @"<" withString: @""] 
						   stringByReplacingOccurrencesOfString: @">" withString: @""] 
						  stringByReplacingOccurrencesOfString: @" " withString: @""];
	
	NSLog(@"Device Token: %@", strToken);
	
	//sent devicetoken to service
	/*
	 .....
	 */
	
	[[NSUserDefaults standardUserDefaults] setObject:strToken forKey:@"devicetoken"];
	[[NSUserDefaults standardUserDefaults] synchronize] ;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
	NSLog(@"userinfo = %@" , userInfo);
	
	NSString *strInfo = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"] ;
	//
//	UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Popic Pro" message:strInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
//	
//	[al show];
//	[al release];
//	
	[self performSelectorOnMainThread:@selector(showAlert:) withObject:strInfo waitUntilDone:YES];
}

-(void)showAlert:(NSString *)str
{
	UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Popic Pro" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
	
	[al show];
	[al release];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
	NSLog(@"error = %@" , error) ;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *strDocumentPath = [paths objectAtIndex:0] ; 
	NSString *strErrorPath = [strDocumentPath stringByAppendingPathComponent:@"error.plist"] ;
	[[error userInfo] writeToFile:strErrorPath atomically:YES] ;
	
	UIAlertView	*alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You register remoteNotification error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
	[alert show] ;
	[alert release] ;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
