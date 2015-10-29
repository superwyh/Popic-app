//
//  controllerDelegate.h
//  PostBar
//
//  Created by chen on 5/31/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol controllerDelegate <NSObject>
@optional

-(void)loadTopic:(NSString *)topicname Tid:(int)tid ;
-(void)loadPosts:(NSString *)Pname Pid:(int)pid  ;
-(void)swipeLeft;
-(void)swipeRight;
@end
