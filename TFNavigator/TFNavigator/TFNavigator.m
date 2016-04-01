//
//  TFNavigator.m
//  TFNavigator
//
//  Created by Melvin on 3/31/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import "TFNavigator.h"
#import "TFRouter.h"
#import "TFURLAction.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
void TFOpenURL(NSString* URL ,NSDictionary *userInfo) {
    [[TFNavigator sharedNavigator] openURLAction:[TFURLAction actionWithURLPath:URL userInfo:userInfo]];
}

@interface TFNavigator() {
    
}

@end

@implementation TFNavigator

+ (instancetype)sharedNavigator {
    static TFNavigator *navigator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!navigator) {
            navigator = [[self alloc] init];
        }
    });
    return navigator;
}

#pragma mark - Public

- (void)map:(NSString *)route toControllerClass:(Class)controllerClass {
    [[TFRouter shared] map:route toControllerClass:controllerClass];
}

- (void)openURLAction:(TFURLAction *)action {
    if (action == nil || action.urlPath == nil) {
        return;
    }
    //third-party app
    NSURL *URL = [NSURL URLWithString:action.urlPath];
    if ([self isAppURL:URL]) {
        [[UIApplication sharedApplication] openURL:URL];
        return;
    }
    UIViewController *viewController = [self matchController:action.urlPath userInfo:action.userInfo];
    if (!viewController) {
        return ;
    }
    //open viewcontroller
    UIViewController *currentController = [[[UIApplication sharedApplication] keyWindow] visibleViewController];
    if (currentController) {
        [currentController.navigationController pushViewController:viewController animated:YES];
    }
}


- (UIViewController *)matchController:(NSString *)route {
    return [self matchController:route userInfo:nil];
}
- (UIViewController *)matchController:(NSString *)route userInfo:(NSDictionary *)userInfo {
    UIViewController *viewController = [[TFRouter shared] matchController:route userInfo:userInfo];
    return viewController;
}

#pragma mark - Private

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isAppURL:(NSURL*)URL {
    return [self isExternalURL:URL]
    || ([[UIApplication sharedApplication] canOpenURL:URL]
        && ![self isWebURL:URL]);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isWebURL:(NSURL*)URL {
    return [URL.scheme caseInsensitiveCompare:@"http"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"https"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"ftp"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"ftps"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"data"] == NSOrderedSame
    || [URL.scheme caseInsensitiveCompare:@"file"] == NSOrderedSame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isExternalURL:(NSURL*)URL {
    if ([URL.host isEqualToString:@"maps.google.com"]
        || [URL.host isEqualToString:@"itunes.apple.com"]
        || [URL.host isEqualToString:@"phobos.apple.com"]) {
        return YES;
        
    } else {
        return NO;
    }
}


@end
