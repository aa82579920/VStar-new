//
//  AliyunEffectMV.h
//  AliyunVideo
//
//  Created by Worthy on 2017/3/17.
//  Copyright (C) 2010-2017 Alibaba Group Holding Limited. All rights reserved.
//

#import "AliyunEffect.h"

/**
 mv效果model类
 */
/****
 A model class that defines MV effects.
 */
@interface AliyunEffectMV : AliyunEffect

/**
 mv音乐流id
 */
/****
 The id of the audio stream in the MV effect.
 */
@property(nonatomic, assign) int audioEffectVid;

/**
 是否关闭mv音乐
 */
/****
 Whether to disable the audio stream in the MV effect.
 */
@property(nonatomic, assign) int disableAudio;

/**
 mv音量大小

 0-100
 */
/****
 The volume of the MV effect.
 
 Valid values: [0, 100]
 */
@property(nonatomic, assign) int audioMixWeight;

/**
 是否对mv去燥

 已废弃，请使用音效列表AliyunAudioEffect代替
 */
/****
 Whether to denoise the MV effect.
 
 Deprecated. Replaced by AliyunAudioEffect.
 */
@property(nonatomic, assign) BOOL denoise __deprecated_msg("deprecated");

/**
 音效列表
 */
/****
 The sound effects.
 */
@property(nonatomic, strong) NSMutableArray<AliyunAudioEffect *> *audioEffects;
@end
