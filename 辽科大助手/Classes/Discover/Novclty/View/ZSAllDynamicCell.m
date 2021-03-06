//
//  ZSAllDynamicCell.m
//  辽科大助手
//
//  Created by MacBook Pro on 16/3/4.
//  Copyright © 2016年 USTL. All rights reserved.
//

#import "ZSAllDynamicCell.h"
#import "ZSAllDynamicFrame.h"
#import "ZSAllDynamic.h"
#import "ZSDynamicPicturesView.h"


@interface ZSAllDynamicCell ()

/** 容器*/
@property (nonatomic, weak) UIView *containerView;

/** 头像imageView*/
@property (nonatomic, weak) UIImageView *iconImageView;

/** 昵称*/
@property (nonatomic, weak) UILabel *nameLabel;

/** 正文*/
@property (nonatomic, weak) UITextView *essayTextView;

/** 时间*/
@property (nonatomic, weak) UILabel *timeLabel;

/** 配图*/
@property (nonatomic, weak) ZSDynamicPicturesView *picturesView;

/** 评论数量*/
@property (nonatomic, weak) UIButton *commentButton;

@end

@implementation ZSAllDynamicCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        /** 容器*/
        UIView *containerView = [[UIView alloc] init];
        self.containerView = containerView;
        [self.contentView addSubview:containerView];
        
        /** 头像imageView*/
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.containerView addSubview:iconImageView];
        
        /** 昵称*/
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setTextColor:[UIColor blueColor]];
        self.nameLabel = nameLabel;
        [self.containerView addSubview:nameLabel];
        
        
        /** 正文*/
        UITextView *essayTextView = [[UITextView alloc] init];
        essayTextView.textContainerInset = UIEdgeInsetsMake(-2, 0, 0, 0);
        essayTextView.userInteractionEnabled = NO;

        essayTextView.backgroundColor = [UIColor redColor];
        essayTextView.font = essayTextFont;
        self.essayTextView = essayTextView;
        [self.containerView addSubview:essayTextView];

        
        /** 时间*/
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel = timeLabel;
        [self.containerView addSubview:timeLabel];
        
        /** 配图*/
        ZSDynamicPicturesView *picturesView = [[ZSDynamicPicturesView alloc] init];
        picturesView.backgroundColor = [UIColor greenColor];
        self.picturesView = picturesView;
        [self.containerView addSubview:picturesView];
        
        
        /** 评论数量*/
        UIButton *commentButton = [[UIButton alloc] init];
        commentButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.commentButton = commentButton;
        
        [self.containerView addSubview:commentButton];
        
    }
    return self;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"allDynamicCell";
    
    ZSAllDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];;

    if (cell == nil) {
        
        cell = [[ZSAllDynamicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setAllDynamicFrame:(ZSAllDynamicFrame *)allDynamicFrame
{
    _allDynamicFrame = allDynamicFrame;
    
    //1. 设置控件frame
    
    /** 容器*/
    self.containerView.frame = allDynamicFrame.containerViewF;
    
    /** 头像imageView*/
    self.iconImageView.frame = allDynamicFrame.iconImageViewF;
    
    /** 昵称*/
    self.nameLabel.frame = allDynamicFrame.nameLabelF;
    
    /** 正文*/
    self.essayTextView.frame = allDynamicFrame.essayTextViewF;
    
    /** 时间*/
    self.timeLabel.frame = allDynamicFrame.timeLabelF;
    
    /** 配图*/
    self.picturesView.frame = allDynamicFrame.picturesViewF;
    
    /** 评论数量*/
    self.commentButton.frame = allDynamicFrame.commentButtonF;
    

    //2.设置数据
    ZSAllDynamic *allDynamic = allDynamicFrame.allDynamic;
    
    /** 头像imageView*/
    self.iconImageView.image = [UIImage imageNamed:@"chaoren"];
    
    /** 昵称*/
    self.nameLabel.text = allDynamic.nickname;
    
    /** 正文*/
    self.essayTextView.text = allDynamic.essay;
    
    /** 时间*/
    self.timeLabel.text = allDynamic.date;
    
    /** 配图*/
    
    
    self.picturesView.pictrueArr = allDynamic.pic;
    
    
    /** 评论数量*/
    
    if ([allDynamic.commentNum integerValue]) {

        [self.commentButton setTitle:allDynamic.commentNum forState:UIControlStateNormal];
    } else {
        
        [self.commentButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    [self.commentButton setImage:[UIImage imageNamed:@"commentNum"] forState:UIControlStateNormal];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
