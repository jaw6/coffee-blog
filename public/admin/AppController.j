/*
 * AppController.j
 * BlogApp
 *
 * Created by Joshua Wehner on April 22, 2010.
 */

@import <Foundation/CPObject.j>
@import "PostsController.j"
// @import "PostListView.j"
@import "PostItemView.j"
@import "Post.j"

@implementation AppController : CPObject
{
    @outlet CPWindow    			theWindow; //this "outlet" is connected automatically by the Cib
		@outlet CPCollectionView	postListCollectionView;
		@outlet CPTextField 			detailsView;
		@outlet PostsController		postsController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // something here isn't working quite right
}

- (void)awakeFromCib
{
	[postListCollectionView setSelectable:YES]
	[postListCollectionView setMinItemSize:CGSizeMake(CGRectGetWidth([postListCollectionView bounds]), 20)]
	[postListCollectionView setMaxItemSize:CGSizeMake(CGRectGetWidth([postListCollectionView bounds]), 20)]
	
	itemPrototype = [[CPCollectionViewItem alloc] init];
	[itemPrototype setView:[[PostItemView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([postListCollectionView bounds]), 20)]];
	[postListCollectionView setItemPrototype:itemPrototype];
	
	[postsController setPostListCollectionView:postListCollectionView]
	[postsController setDetailsView:detailsView]

	[postsController loadPosts];
}

@end
