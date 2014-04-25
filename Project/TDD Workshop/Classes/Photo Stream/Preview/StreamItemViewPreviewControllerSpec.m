#import "Specs.h"
#import "StreamItemPreviewViewController.h"
#import "StreamItemPreviewLayout.h"
#import "StreamItem.h"
#import "StreanItemPreviewCell.h"

SPEC_BEGIN(StreamItemViewPreviewControllerSpec)
fdescribe(@"StreamItemViewPreviewController", ^{
    __block StreamItemPreviewViewController *itemPreviewViewController;

    beforeEach(^{
        itemPreviewViewController = [StreamItemPreviewViewController new];
    });
    afterEach(^{
        itemPreviewViewController = nil;
    });

    describe(@"when view is loaded", ^{

        beforeEach(^{
            [itemPreviewViewController view];
        });

        it(@"should be collection view", ^{
            expect(itemPreviewViewController.view).to.beKindOf([UICollectionView class]);
        });

        it(@"should have white background color", ^{
            expect(itemPreviewViewController.view.backgroundColor).to.equal([UIColor whiteColor]);
        });

        it(@"should have custom collection view layout", ^{
            UICollectionView *collectionView = (UICollectionView *) itemPreviewViewController.view;
            expect(collectionView.collectionViewLayout).to.beKindOf([StreamItemPreviewLayout class]);
        });

        it(@"should have paging ", ^{
            UICollectionView *collectionView = (UICollectionView *) itemPreviewViewController.view;
            expect(collectionView.pagingEnabled).to.beTruthy();
        });

        it(@"should have set collection view data source to controller", ^{
            UICollectionView *collectionView = (UICollectionView *) itemPreviewViewController.view;
            expect(collectionView.dataSource).to.equal(itemPreviewViewController);
        });

    });

    describe(@"when initilized with items", ^{
        __block NSArray *items;

        beforeEach(^{
            items = @[[StreamItem  new], [StreamItem new]];
            itemPreviewViewController = [[StreamItemPreviewViewController alloc] initWithStreamItems:items];
        });

        it(@"should return number of cells equal that match items count", ^{
            expect([itemPreviewViewController collectionView:nil numberOfItemsInSection:0]).to.equal([items count]);
        });

        it(@"should return cell for each item", ^{
            UICollectionView *collectionView = (UICollectionView *) itemPreviewViewController.view;
            for (NSInteger i = 0; i < [items count]; i++){
                NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
                UICollectionViewCell *cell = [itemPreviewViewController collectionView:collectionView cellForItemAtIndexPath:path];
                expect(cell).to.beKindOf([StreanItemPreviewCell class]);
            }
        });
    });


});
SPEC_END