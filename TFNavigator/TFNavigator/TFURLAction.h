//
//  TFURLAction.h
//  TFNavigator
//
//  Created by Melvin on 3/31/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFURLAction : NSObject

@property (nonatomic ,copy) NSString *urlPath;
@property (nonatomic ,strong) NSDictionary *userInfo;
@property (nonatomic ,weak) UINavigationController *navigationController;
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
