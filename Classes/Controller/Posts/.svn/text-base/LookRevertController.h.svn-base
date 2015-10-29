//
//  LookRevert.h
//  PostBar
//
//  Created by DQ on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LookRevertCell.h"

@interface LookRevertController : UIViewController <UITextViewDelegate,LookRevrtCellDelegate>{
	NSMutableArray  *m_uname;
	NSMutableArray  *m_content;
	NSIndexPath		*m_indexPath;
	int				m_pid;
	int				m_puid;
	NSString		*m_pname;
	IBOutlet	 UITextView	   *m_recontent;
	IBOutlet	 UITableView   *m_tableView;
}
@property (retain,nonatomic)NSDictionary *m_dic;
@property (retain,nonatomic)NSIndexPath	 *m_indexPath;
@property (nonatomic)int			  m_puid;
@property (nonatomic)int			  m_pid;
@property (nonatomic,retain)NSString	*m_pname;

-(IBAction)bigTouchButton;
-(IBAction)back;
-(void)setarr :(NSArray * )arr;
-(IBAction)revertPost;
-(void)setdic:(NSDictionary *)dic;


@end
