//
//  AutoCell.m
//  AutoTableViewCell
//
//  Created by macbook on 16/1/21.
//  Copyright © 2016年 DLD. All rights reserved.
//

#import "AutoCell.h"
#import "UIView+RSAdditions.h"

#define TitleLabelWidth 200
#define DetialLabelWidth [UIScreen mainScreen].bounds.size.width-20

@interface AutoCell (){
    UILabel * _titleLabel;
    UILabel * _detailLabel;
}
@end

@implementation AutoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc]init];
        _detailLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _detailLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.backgroundColor = [UIColor yellowColor];
        _detailLabel.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

-(void)setArray:(NSArray *)array{
    _array = array;
    
    _titleLabel.text = array[0];
    _detailLabel.text = array[1];
    
    CGFloat titleLabelHeight = [self autoHightWithText:array[0] LabelWidth:TitleLabelWidth andDicOfFont:@{NSFontAttributeName:_titleLabel.font}];
    CGFloat detailLabelHeight = [self autoHightWithText:array[1] LabelWidth:DetialLabelWidth andDicOfFont:@{NSFontAttributeName:_detailLabel.font}];
    
    _titleLabel.frame = CGRectMake(10, 10, TitleLabelWidth, titleLabelHeight);
    _detailLabel.frame = CGRectMake(10, _titleLabel.bottom+10, DetialLabelWidth, detailLabelHeight);
    
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_detailLabel];
}

//动态获取高度
-(CGFloat)autoHightWithText:(NSString *)text LabelWidth:(CGFloat)labelWidth andDicOfFont:(NSDictionary *)dicOfFont{
    return [text boundingRectWithSize:CGSizeMake(labelWidth, 1000) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dicOfFont context:nil].size.height;
}

-(CGFloat)cellHeightWithArray:(NSArray *)array{
    return [self autoHightWithText:array[0] LabelWidth:TitleLabelWidth andDicOfFont:@{NSFontAttributeName:_titleLabel.font}]+[self autoHightWithText:array[1] LabelWidth:DetialLabelWidth andDicOfFont:@{NSFontAttributeName:_detailLabel.font}];
}




@end
