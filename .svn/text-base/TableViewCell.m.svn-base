//
//  TableViewCell.m
//  PostBar
//
//  Created by chen on 6/9/11.
//  Copyright 2011 http://cnblogs.com/mainPage/. All rights reserved.
//

#import "TableViewCell.h"


@implementation TableViewCell
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		UISwipeGestureRecognizer *swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tablecellswipeLeft)];
		swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer:swipeleft];
		[swipeleft release];
		
		UISwipeGestureRecognizer *swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tablecellswipeRight)];
		swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer:swipeRight];
		[swipeRight release];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}
#pragma mark -
#pragma mark myAction

- (void) handdleLeftSwipe {	
	if (delegate && [delegate respondsToSelector:@selector(swipeLeft)]) {
		[delegate swipeLeft];
	}
}


- (void) handdleRightSwipe {
	if (delegate && [delegate respondsToSelector:@selector(swipeRight)]) {
		[delegate swipeRight];
	}
	
}

-(void)tablecellswipeLeft{
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(tablecellswipeLeft) object:nil];
	[self performSelector:@selector(handdleLeftSwipe) withObject:nil afterDelay:0.2f];
	
}
-(void)tablecellswipeRight{
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(tablecellswipeRight) object:nil];
	[self performSelector:@selector(handdleRightSwipe) withObject:nil afterDelay:0.2f];
}
	

@end
