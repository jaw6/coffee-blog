@STATIC;1.0;I;21;Foundation/CPObject.ji;17;PostsController.ji;14;PostItemView.ji;6;Post.jt;1695;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("PostsController.j", YES);
objj_executeFile("PostItemView.j", YES);
objj_executeFile("Post.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow"), new objj_ivar("postListCollectionView"), new objj_ivar("detailsView"), new objj_ivar("postsController")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
}
},["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{ with(self)
{
 objj_msgSend(postListCollectionView, "setSelectable:", YES)
 objj_msgSend(postListCollectionView, "setMinItemSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(postListCollectionView, "bounds")), 20))
 objj_msgSend(postListCollectionView, "setMaxItemSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(postListCollectionView, "bounds")), 20))
 itemPrototype = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
 objj_msgSend(itemPrototype, "setView:", objj_msgSend(objj_msgSend(PostItemView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(objj_msgSend(postListCollectionView, "bounds")), 20)));
 objj_msgSend(postListCollectionView, "setItemPrototype:", itemPrototype);
 objj_msgSend(postsController, "setPostListCollectionView:", postListCollectionView)
 objj_msgSend(postsController, "setDetailsView:", detailsView)
 objj_msgSend(postsController, "loadPosts");
}
},["void"])]);
}

