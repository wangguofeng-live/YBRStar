//
//  YBRStar.h
//  YBRInsiderApp
//
//  Created by bdkj on 2017/2/20.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBRStar : UIView

@property(nonatomic,assign)CGFloat scorePercent;
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStar;

@end
