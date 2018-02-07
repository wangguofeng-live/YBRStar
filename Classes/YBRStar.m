//
//  YBRStar.m
//  YBRInsiderApp
//
//  Created by bdkj on 2017/2/20.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import "YBRStar.h"

#define FOREGROUND_STAR_IMAGE_NAME @"ybr_star_resources_00"
#define BACKGROUND_STAR_IMAGE_NAME @"ybr_star_resources_02"
#define DEFALUT_STAR_NUMBER 5
@interface YBRStar()
@property(nonatomic,strong)UIView *foregroundStarView;
@property(nonatomic,strong)UIView *backgroundStarView;
@property(nonatomic,assign)NSInteger numberOfStars;

@end
@implementation YBRStar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStar{
    if (self=[super initWithFrame:frame]) {
        _numberOfStars=numberOfStar;
        [self bulidDataAndUI];
    }
    return self;
}
-(void)bulidDataAndUI
{
    _scorePercent=1;
    self.foregroundStarView=[self creatStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    self.backgroundStarView=[self creatStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
}
-(UIView*)creatStarViewWithImage:(NSString*)imageName
{
    UIView *view=[[UIView alloc]initWithFrame:self.bounds];
    view.clipsToBounds=YES;
    view.backgroundColor=[UIColor clearColor];
    for (int i=0; i<self.numberOfStars; i++) {
        UIImageView *imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imgView.frame=CGRectMake(i*self.bounds.size.width/self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imgView.contentMode=UIViewContentModeScaleAspectFit;
        [view addSubview:imgView];
    }
    return view;
}
-(void)setScorePercent:(CGFloat)scorePercent
{
    if (_scorePercent==scorePercent) {
        return;
    }
    if (scorePercent<0) {
        _scorePercent=0;
    }else if (scorePercent>1){
        _scorePercent=1;
    }else{
        _scorePercent=scorePercent;
    }
    self.foregroundStarView.frame=CGRectMake(0, 0, self.bounds.size.width*scorePercent, self.bounds.size.height);
}

@end
