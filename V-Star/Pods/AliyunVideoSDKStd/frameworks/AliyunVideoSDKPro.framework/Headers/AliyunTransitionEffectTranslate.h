//
//  AliyunTransitionEffectTranslate.h
//  QUSDK
//
//  Created by Vienta on 2018/5/31.
//  Copyright © 2018年 Alibaba Group Holding Limited. All rights reserved.
//

#import "AliyunTransitionEffect.h"
#import <AliyunVideoSDKPro/AliyunVideoSDKPro.h>
/**
 平移方向
 DIRECTION_LEFT：    向左平移
 DIRECTION_RIGHT：   向右平移
 DIRECTION_TOP：     向上平移
 DIRECTION_BOTTOM：  向下平移
 */
/****
 Directions of translational motions.
 DIRECTION_LEFT：    Left
 DIRECTION_RIGHT：   Right
 DIRECTION_TOP：     Upward
 DIRECTION_BOTTOM：  Downward
 */
typedef NS_ENUM(NSInteger, DIRECTION_TYPE) {
    DIRECTION_LEFT = 0,
    DIRECTION_RIGHT = 1,
    DIRECTION_TOP = 2,
    DIRECTION_BOTTOM
};

/**
 平移效果的转场
 */
/****
 A class that defines translational motion effects.
 */
@interface AliyunTransitionEffectTranslate : AliyunTransitionEffect

/**
 移动方向
 */
/****
 The direction of the translational motion.
 */
@property(nonatomic, assign) DIRECTION_TYPE direction;

/**
 初始化方法

 @param dict 参数
 @return 平移实例对象
 */
/****
 Initializer.

 @param dict The initialization parameter.
 @return A translational motion object.
 */
- (id)initWithRestore:(NSDictionary *)dict __deprecated_msg("deprecated");

@end
