//
//  TFURLAction.h
//  TFNavigator
//
//  Created by Melvin on 3/31/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TFURLAction;
typedef void(^TFActionCompletionBlock)(__kindof TFURLAction *action);


@interface TFURLAction : NSObject

@property (nonatomic ,copy) NSString *urlPath;
@property (nonatomic ,strong) NSDictionary *userInfo;
/**
 *  弹出模式
 */
@property (nonatomic ,assign) BOOL presentModel;
/**
 *  弹出模式回调
 */
@property (nonatomic, copy) TFActionCompletionBlock actionCompletionBlock;

//@property (nonatomic ,weak) UINavigationController *navigationController;
/**
 *  根据url 与 userinfo 构建 TFURLAction
 *
 *  @param urlPath  路由路径
 *  @param userInfo 自定义信息
 *
 *  @return 
 */
+ (id)actionWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo;

- (id)initWithURLPath:(NSString*)urlPath userInfo:(NSDictionary *)userInfo;

- (TFURLAction*)applyAnimated:(BOOL)animated;



@end
