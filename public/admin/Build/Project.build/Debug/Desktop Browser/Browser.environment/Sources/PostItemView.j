@STATIC;1.0;I;15;AppKit/CPView.jt;1142;


objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "PostItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("title")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $PostItemView__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
 if (!title)
 {
  title = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 150.0, 20.0));
  objj_msgSend(title, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
  objj_msgSend(self, "addSubview:", title);
 }

 objj_msgSend(title, "setStringValue:", objj_msgSend(anObject, "title"));
}
},["void","id"]), new objj_method(sel_getUid("setSelected:"), function $PostItemView__setSelected_(self, _cmd, isSelected)
{ with(self)
{
 objj_msgSend(self, "setBackgroundColor:", isSelected ? objj_msgSend(CPColor, "colorWithHexString:", "3d80df") : nil);
 objj_msgSend(title, "setTextColor:", isSelected ? objj_msgSend(CPColor, "whiteColor") : objj_msgSend(CPColor, "blackColor"));
}
},["void","BOOL"])]);
}

