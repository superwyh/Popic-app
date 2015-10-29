//
//  LookRevertCell.m
//  PostBar
//
//  Created by DQ on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LookRevertCell.h"


@implementation LookRevertCell
@synthesize m_labelFrom;
@synthesize m_Content;
@synthesize m_indexPath;
@synthesize m_delegate;
@synthesize m_button;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void) setContent: (NSIndexPath *) indexPath
{
	self.m_indexPath=indexPath;
	
	
}
-(IBAction)revert
{
	[m_delegate getIndex:m_indexPath];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
