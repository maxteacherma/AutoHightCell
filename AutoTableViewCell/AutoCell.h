//
//  AutoCell.h
//  AutoTableViewCell
//
//  Created by macbook on 16/1/21.
//  Copyright © 2016年 DLD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoCell : UITableViewCell
//可以采用model
@property (nonatomic,strong)NSArray * array;

//cellwith model
- (CGFloat)cellHeightWithArray:(NSArray *)array;

@end
