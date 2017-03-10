//
//  FooterView.m
//  uicollectionview
//
//  Created by 窦心东 on 2017/3/6.
//  Copyright © 2017年 窦心东. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 50, 20)];
        _titleLabel.textColor = [UIColor greenColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    
    [self addSubview:self.titleLabel];
    
}

@end
