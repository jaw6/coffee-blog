@STATIC;1.0;I;15;AppKit/CPView.jt;1505;


objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPCollectionView, "PostListView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("itemPrototype")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $PostListView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PostListView").super_class }, "initWithFrame:", aFrame);
 if (self)
 {
  objj_msgSend(self, "setMinItemSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "bounds")), 20));
  objj_msgSend(self, "setMaxItemSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "bounds")), 20));

  itemPrototype = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
  objj_msgSend(itemPrototype, "setView:", objj_msgSend(objj_msgSend(PostItemView, "alloc"), "initWithFrame:", CGRectMakeZero()));
  objj_msgSend(self, "setItemPrototype:", itemPrototype);
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("getCurrentObject"), function $PostListView__getCurrentObject(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "content"), "objectAtIndex:", objj_msgSend(self, "getSelectedIndex"));
}
},["id"]), new objj_method(sel_getUid("getSelectedIndex"), function $PostListView__getSelectedIndex(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "selectionedIndexes"), "firstIndex");
}
},["int"])]);
}

