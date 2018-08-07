//
//  AFNDownloadManager.m
//  AFNetWorkingDownProject
//
//  Created by Yee on 2018/8/6.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "AFNDownloadManager.h"
#import <AFNetworking.h>
@interface AFNDownloadManager ()

@property(nonatomic,retain)NSOperationQueue  *operationQueue;

@end

@implementation AFNDownloadManager

+(AFNDownloadManager*)downManager{
    static dispatch_once_t onceToken;
    static AFNDownloadManager *_manager = nil;
    dispatch_once(&onceToken, ^{
        
        _manager = [[AFNDownloadManager alloc] init];
    });
    return _manager;
}
@end
