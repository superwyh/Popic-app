//
//  LookRevertCell.h
//  PostBar
//
//  Created by DQ on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LookRevrtCellDelegate ;

@interface LookRevertCell : UITableViewCell {
	IBOutlet UILabel	*m_labelFrom;
	IBOutlet UIWebView  *m_Content;
	IBOutlet UIButton	*m_button;
	NSIndexPath		*m_indexPath;
	id<LookRevrtCellDelegate> m_delegate;
}
@property (nonatomic , assign) id<LookRevrtCellDelegate> m_delegate;
@property (retain,nonatomic)NSIndexPath	 *m_indexPath;
@property (nonatomic,retain)UILabel		*m_labelFrom;
@property (nonatomic,retain)UIWebView   *m_Content;
@property (nonatomic,retain)UIButton	*m_button;
-(IBAction)revert;
- (void) setContent: (NSIndexPath *) indexPath;
@end

@protocol LookRevrtCellDelegate <NSObject>

@optional

- (void)getIndex:(NSIndexPath *)indexPaht;

@end