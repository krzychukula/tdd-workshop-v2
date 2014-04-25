//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreanItemPreviewCell.h"


@implementation StreanItemPreviewCell

#pragma mark - Object life cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithImage:nil];
        self.imageView.backgroundColor = [UIColor whiteColor];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundView = self.imageView;
    }
    return self;
}



@end