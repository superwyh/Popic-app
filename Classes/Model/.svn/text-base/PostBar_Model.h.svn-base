//
//  PostBar_Model.h
//  PostBar
//
//  Created by DQ on 7/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHttpHeaders.h"
#import "FBConnect.h"
#import "FBRequest.h"
@protocol PostBar_ModelDelegate ;
@interface PostBar_Model : UIViewController<FBSessionDelegate,FBRequestDelegate> {
	
	id<PostBar_ModelDelegate> delegate ;
	
	
	int  m_uid;
	NSString	*m_uName;
	Facebook	*m_facebook;
	NSArray		*m_facebookPermissions;
	NSString	*m_facebookUserName ;
	NSString	*m_facebookId ;
	
	BOOL		m_bIsInvite ;
}
@property(nonatomic,assign ) id<PostBar_ModelDelegate> delegate ;
@property (nonatomic)			int		m_uid;
@property(nonatomic,retain)	 NSString	*m_uName;
@property(readonly)			 Facebook	*m_facebook;
@property(nonatomic,retain ) NSString	*m_facebookUserName ;
@property(nonatomic,retain ) NSString	*m_facebookId ;
@property(nonatomic,assign ) BOOL		m_bIsInvite ;
/**
 * 获取登录用户的uid
 
 */

-(int)getUid;
/**
 * 获取登录用户的uName
 
 */
-(NSString *)getUname;
/**
 * 注销登录用户
 
 */
-(void )deleteUname;
+(PostBar_Model *)ShareObjects;
-(NSString *)GetString:(NSString *)url;
//faceBook登录
- (void)	facebookLogin ;
- (NSString *) facebookLog2MyServer ;

- (void) fetchFacebookUser ;

- (NSArray *) getFacebookFriendList ;

- (void) sendInviteMsg2FacebookFriends ;
//UsersMethod
/**
 * 用户登陆 
 * （已完成）
 * @param name : 登录的用户名
 *
 * @param pass : 登录的密码
 * @return 400:  为登录错误
 */
-(NSString *)Login:(NSString *)name Password:(NSString *)pass;
/**
 * 用户注册
 * （已完成）
 * @param name : 注册用户名
 * @param email : 注册email
 * @param pass : 注册密码 
 * @return NSString: "Login failed!" 为已存在该用户
 * @return NSString: "Add success!" 为添加成功
 

 */
-(NSString *)RegisterUser:(NSString *)name Password:(NSString *)pass EMail:(NSString *)email;

/**
 * 修改密码 
 * （已完成）
 * @param oldpass : 旧密码
 *
 * @param confirm : 新密码 
 * @return NSString: "Modify success!" 为修改成功
 */
-(NSString *)ResetPassword:(NSString *)oldpass  Confirm:(NSString *)confirmPass;
//FourView
/**
 * （已完成）
 * 获取最新的贴子 
 
 */
-(NSDictionary *)getChangePost;
/**
 * （已完成）
 * 获取最新的贴吧 
 
 */
-(NSDictionary *)getChangeTopic;
/**
 * 获取本周最新的贴子 
 */
-(NSDictionary *)getWeeklyPost;
/**
 * 获取最新的贴吧 
 */
-(NSDictionary *)getWeeklyTopic;
/**
 * 获取最喜欢的贴子 
 */
-(NSDictionary *)getfavouritePost;
/**
 * 获取最新的贴吧 
 */
-(NSDictionary *)getfavouriteTopic;
/**
 * 获取最热的贴子 
 */
-(NSDictionary *)getHotPost;
/**
 * 获取最新的贴吧 
 */
-(NSDictionary *)getHotTopic;

//Posts


/**
 * 储存贴吧 
 
 * @param tid : 贴吧id
 *
 
 */
-(NSString *)SaveTopic:(int)tid;
/**
 * 存储贴子 
 * @param pid : 贴子id
 * @return NSString:"success!"为成功
 * @return NSString:"Already added!"为已添加过
 */
-(NSString *)SavePost:(int)pid;
/**
 * 查看回帖 
 * @param pid : 贴子id
 * @return NSString:"Modify success!"为成功
 * @return NSString:"Already added!"为已添加过
 */
-(NSArray  *)Comments:(int)pid;
/**
 * 根据id获取贴子详细信息和将贴子加入进历史列表 
 * @param pid : 贴子id
 * 
 * @return nil:为没数据
 */
-(NSDictionary *)HistoryResult:(int)pid;
/**
 * 获取历史记录的贴子 
 * 
 * @return NSDictionary
 */
-(NSDictionary *)HistoryView;
/**
 * 回帖 
 * @param pid : 贴子id
 * @param recontent : 贴子内容
 * @return NSString:“Reply to success!”为成功
 * @return nil:为没数据
 */
-(NSString *)RePost:(int)pid Recontent:(NSString *)recontent Puid:(int)pUid Pname:(NSString *)pname;
/**
 * 查询 
 * @param searchContent : 查询内容
 * @param TorP : 是贴吧还是贴子，贴吧是YES，贴子是NO
 * @return NSDictionary:
 */
-(NSDictionary *)Search:(NSString *)searchContent IsTopicOrPost:(BOOL)TorP;
/**
 * 发帖 
 * （已完成）
 * @param tid : 贴吧id
 * @param pName : 贴吧标题
 * @param pContent : 贴吧内容
 * @param dataImage : 传入图片（可以为空）
 * @param dataMusic : 传入音乐（可以为空）
 * @return NSString	: "add success！"为添加成功

 */
-(NSString *)PostPosts:(int)tid PostName:(NSString *)pName PostContent:(NSString *)pContent DataImage:(NSData *)dataImage DataMusic:(NSData *)dataMusic;
/**
 * 根据贴吧ID查询贴子
 * @param tid : 贴吧ID
 * @return NSDictionary:
 */
-(NSDictionary *)TopicView:(int)tid;
/**
 * 创建贴吧
 * @param tName : 贴吧名称
 * @return NSString:
 */
-(NSString *)creatTopic:(NSString *)tName;
/*http://192.168.1.14:8080/PostBar/servlet/UsersServlet?op=Login&
 传来参数:
 logintype:[facebook|local]
 token:xxx
 name:xxx*/
@end
@protocol PostBar_ModelDelegate <NSObject>
@optional

- (void) facebookLoginSuccess ;
- (void) fetchUserSuccess ;
- (void) getFacebookFriendSuccess : (NSArray *) array ;

@end