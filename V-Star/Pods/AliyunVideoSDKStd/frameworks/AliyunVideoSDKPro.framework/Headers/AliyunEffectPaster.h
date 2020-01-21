//
//  AliyunEffectGif.h
//  qurecorder
//
//  Created by Vienta on 2017/1/7.
//  Copyright (C) 2010-2017 Alibaba Group Holding Limited. All rights reserved.
//

#import "AliyunEffectPasterBase.h"
#import "AliyunEffectPasterFrameItem.h"
#import "AliyunEffectPasterTimeItem.h"
#import "AliyunIEffectRecovery.h"
#import <UIKit/UIKit.h>

/**
 动图类型

 - AliyunPasterTypeNormal: 普通动图
 - AliyunPasterTypeFace: 人脸动图
 */
/****
 Sticker types.

 - AliyunPasterTypeNormal: Normal sticker
 - AliyunPasterTypeFace: Face sticker
 */
typedef NS_ENUM(NSInteger, AliyunPasterType) {
    AliyunPasterTypeNormal,
    AliyunPasterTypeFace,
};

/**
 动图model类（动图,包含人脸和普通两种类型）
 */
/****
 A model class that defines stickers.
 */
@interface AliyunEffectPaster : AliyunEffectPasterBase <AliyunIEffectRecovery>

/**
 动图类型
 */
/****
 The sticker type.
 */
@property(nonatomic, assign) AliyunPasterType type;

/**
 关键帧图片
 */
/****
 The key frame image. 
 */
@property(nonatomic, strong) UIImage *kernelImage;

/**
 动画的场景集合

 例如：动画场景可以分为进场、场中和出场
 */
/****
 The stages when rendering the sticker animation.
 
 The stages include: appear, display, and disappear.
 */
@property(nonatomic, copy) NSArray<AliyunEffectPasterTimeItem *> *timeItems;

/**
 动画帧集合

 即指定在某时间播放某一张图片
 */
/****
 The frames of the sticker. 
 */
@property(nonatomic, copy) NSArray<AliyunEffectPasterFrameItem *> *frameItems;

/**
 动图原始时长

 从动图的配置文件解析而来
 */
/****
 The original duration of the sticker.
 
 The duration is specified in the configuration file.
 */
@property(nonatomic, assign, readonly) CGFloat originDuration;

- (AliyunEffectPaster *)copyAnother __deprecated_msg("deprecated");

- (id)initWithRestore:(NSDictionary *)dict __deprecated_msg("deprecated");

@end
