//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemPreviewViewController.h"
#import "StreamItem.h"
#import "StreamItemPreviewLayout.h"
#import "StreanItemPreviewCell.h"


NSString *const kCellId = @"CellId";

@interface StreamItemPreviewViewController ()
@property(nonatomic, weak) UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *streamItems;
@end

@implementation StreamItemPreviewViewController

#pragma mark - Object life cycle

- (id)initWithStreamItems:(NSArray *)streamItems {
    self = [super init];
    if (self) {
        self.streamItems = streamItems;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];

    }
    return self;
}

#pragma mark - View life cycle

- (void)loadView {
    StreamItemPreviewLayout *layout = [StreamItemPreviewLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self setupCollectionView:collectionView];
    self.view = collectionView;
}

- (void)setupCollectionView:(UICollectionView *)collectionView {
    collectionView.pagingEnabled = YES;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[StreanItemPreviewCell class] forCellWithReuseIdentifier:kCellId];
}

- (UICollectionView *)collectionView {
    return (UICollectionView *) self.view;
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.streamItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StreanItemPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    cell.imageView.image = [streamItem image];
    return cell;
}

@end