//
//  QUIImportor.h
//  AliyunVideo
//
//  Created by Worthy on 2017/3/14.
//  Copyright (C) 2010-2017 Alibaba Group Holding Limited. All rights reserved.
//

#import "AliyunIClipConstructor.h"
#import "AliyunVideoParam.h"
#import <Foundation/Foundation.h>
#import <Photos/PHAsset.h>
#import <UIKit/UIKit.h>

/**
 编辑导入类

 用于构建编辑初始化配置文件
 实现了AliyunIClipConstructor协议，用于配置媒体片段
 */
/****
 A class that defines importers.
 Use this class to create configuration files for importing media clips.
 The class implements the AliyunIClipConstructor protocol to configure media clips.
 */
@interface AliyunImporter : NSObject <AliyunIClipConstructor>

/**
 初始化AliyunImporter

 @param taskPath taskPath文件夹地址，保证文件夹已存在
 @param outputSize 导出视频分辨率设置，必须为偶数
 @return AliyunImporter
 */
/****
 Initializer.

 @param taskPath The path to the taskPath folder.
 @param outputSize The output video resolution. Even numbers only.
 @return AliyunImporter
 */
- (instancetype)initWithPath:(NSString *)taskPath outputSize:(CGSize)outputSize;

/**
 设置视频输出参数

 @param videoParam 视频输出参数
 */
/****
 Sets the video output parameter.
 
 @param videoParam The output parameter.
 */
- (void)setVideoParam:(AliyunVideoParam *)videoParam;

/**
 在taskPath目录下，生成配置文件
 */
/****
 Generates the configuration file in the taskPath folder.
 */
- (void)generateProjectConfigure;

@end
