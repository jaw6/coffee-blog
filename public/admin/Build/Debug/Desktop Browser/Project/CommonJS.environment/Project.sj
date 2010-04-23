@STATIC;1.0;p;15;AppController.jt;1791;@STATIC;1.0;I;21;Foundation/CPObject.ji;17;PostsController.ji;14;PostItemView.ji;6;Post.jt;1695;objj_executeFile("Foundation/CPObject.j", NO);
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

p;6;main.jt;295;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;209;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("AppController.j", YES);
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

p;6;Post.jt;3954;@STATIC;1.0;I;21;Foundation/CPObject.jt;3909;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Post"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("title"), new objj_ivar("body"), new objj_ivar("id")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("title"), function $Post__title(self, _cmd)
{ with(self)
{
return title;
}
},["id"]),
new objj_method(sel_getUid("setTitle:"), function $Post__setTitle_(self, _cmd, newValue)
{ with(self)
{
title = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("body"), function $Post__body(self, _cmd)
{ with(self)
{
return body;
}
},["id"]),
new objj_method(sel_getUid("setBody:"), function $Post__setBody_(self, _cmd, newValue)
{ with(self)
{
body = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("id"), function $Post__id(self, _cmd)
{ with(self)
{
return id;
}
},["id"]),
new objj_method(sel_getUid("setId:"), function $Post__setId_(self, _cmd, newValue)
{ with(self)
{
id = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $Post__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Post").super_class }, "init") ;

    if (self)
    {
        id = 0;
        title = "" ;
        body = "" ;
    }

    return self ;
}
},["id"]), new objj_method(sel_getUid("initFromJSONObject:"), function $Post__initFromJSONObject_(self, _cmd, aJSONObject)
{ with(self)
{
    self = objj_msgSend(self, "init") ;

    if (self)
    {
        id = aJSONObject.id ;
        title = aJSONObject.title ;
        body = aJSONObject.body ;
    }

    return self ;
}
},["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initFromJSONObjects:"), function $Post__initFromJSONObjects_(self, _cmd, someJSONObjects)
{ with(self)
{
    var posts = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init") ;

    for (var i=0; i < someJSONObjects.length; i++) {
        var post = objj_msgSend(objj_msgSend(Post, "alloc"), "initFromJSONObject:", someJSONObjects[i].post) ;
        objj_msgSend(posts, "addObject:", post) ;
    };

    return posts ;
}
},["CPArray","CPString"]), new objj_method(sel_getUid("getExamplePosts"), function $Post__getExamplePosts(self, _cmd)
{ with(self)
{
    var array = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init") ;
    var post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;

    objj_msgSend(post, "setTitle:", "This is the first post") ;
    objj_msgSend(post, "setBody:", "This is the body of the first post") ;
    objj_msgSend(array, "addObject:", post) ;

    post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;
    objj_msgSend(post, "setTitle:", "This is the second post") ;
    objj_msgSend(post, "setBody:", "This is the body of the second post") ;
    objj_msgSend(array, "addObject:", post) ;

    post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;
    objj_msgSend(post, "setTitle:", "This is the third post") ;
    objj_msgSend(post, "setBody:", "This is the body of the third post") ;
    objj_msgSend(array, "addObject:", post) ;

    post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;
    objj_msgSend(post, "setTitle:", "This is the fourth post") ;
    objj_msgSend(post, "setBody:", "This is the body of the fourth post") ;
    objj_msgSend(array, "addObject:", post) ;

    post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;
    objj_msgSend(post, "setTitle:", "This is the fifth post") ;
    objj_msgSend(post, "setBody:", "This is the body of the fifth post") ;
    objj_msgSend(array, "addObject:", post) ;

    post = objj_msgSend(objj_msgSend(Post, "alloc"), "init") ;
    objj_msgSend(post, "setTitle:", "This is the sixth post") ;
    objj_msgSend(post, "setBody:", "This is the body of the sixth post") ;
    objj_msgSend(array, "addObject:", post) ;

    return array ;
}
},["CPArray"])]);
}

p;14;PostItemView.jt;1181;@STATIC;1.0;I;15;AppKit/CPView.jt;1142;


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

p;14;PostListView.jt;1544;@STATIC;1.0;I;15;AppKit/CPView.jt;1505;


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

p;17;PostsController.jt;5831;@STATIC;1.0;I;21;Foundation/CPObject.jt;5786;


objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "PostsController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("postListCollectionView"), new objj_ivar("detailsView"), new objj_ivar("baseURL"), new objj_ivar("currentObject"), new objj_ivar("listConnection"), new objj_ivar("addConnection"), new objj_ivar("updateConnection"), new objj_ivar("deleteConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("postListCollectionView"), function $PostsController__postListCollectionView(self, _cmd)
{ with(self)
{
return postListCollectionView;
}
},["id"]),
new objj_method(sel_getUid("setPostListCollectionView:"), function $PostsController__setPostListCollectionView_(self, _cmd, newValue)
{ with(self)
{
postListCollectionView = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("detailsView"), function $PostsController__detailsView(self, _cmd)
{ with(self)
{
return detailsView;
}
},["id"]),
new objj_method(sel_getUid("setDetailsView:"), function $PostsController__setDetailsView_(self, _cmd, newValue)
{ with(self)
{
detailsView = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $PostsController__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PostsController").super_class }, "init"))
    {
        baseURL = "http://localhost:3000" ;
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("collectionViewDidChangeSelection:"), function $PostsController__collectionViewDidChangeSelection_(self, _cmd, collectionView)
{ with(self)
{
    var selectedIndex = objj_msgSend(objj_msgSend(collectionView, "selectionIndexes"), "firstIndex");
    currentObject = objj_msgSend(objj_msgSend(collectionView, "content"), "objectAtIndex:", selectedIndex)

    objj_msgSend(detailsView, "setStringValue:", objj_msgSend(currentObject, "body"));
}
},["void","CPCollectionView"]), new objj_method(sel_getUid("loadExamplePosts"), function $PostsController__loadExamplePosts(self, _cmd)
{ with(self)
{
    var posts = objj_msgSend(Post, "getExamplePosts") ;
    objj_msgSend(postListCollectionView, "setContent:", posts) ;
}
},["void"]), new objj_method(sel_getUid("loadPosts"), function $PostsController__loadPosts(self, _cmd)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", baseURL + "/posts.json");
    objj_msgSend(request, "setHTTPMethod:",  "GET");
    listConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("addItem:"), function $PostsController__addItem_(self, _cmd, sender)
{ with(self)
{

    var title = prompt("Enter the title") ;
    var body = prompt("Enter the body") ;

    if (title!=="" && body!=="")
    {
        var JSONString = '{"post":{"title":"'+title+'","body":"'+body+'"}}'


        var request = objj_msgSend(CPURLRequest, "requestWithURL:", baseURL + "/posts.json");
        objj_msgSend(request, "setHTTPMethod:",  "POST");
        objj_msgSend(request, "setHTTPBody:",  JSONString);
        objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Accept") ;
        objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Content-Type") ;
        addConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
    else
    {
        alert("Please provide a value for both title and body");
    }
}
},["@action","id"]), new objj_method(sel_getUid("editSelectedItem:"), function $PostsController__editSelectedItem_(self, _cmd, sender)
{ with(self)
{
 var title = prompt('Modify the title', objj_msgSend(currentObject, "title"))
 var body = prompt('Modify the body', objj_msgSend(currentObject, "body"))

 if (title !=='' && body !=='')
 {
  var json = {'post': {'title': title, 'body': body}}
  var jsonstring = JSON.stringify(json)
  var request = objj_msgSend(CPURLRequest, "requestWithURL:", baseURL+'/posts/'+objj_msgSend(currentObject, "id")+'.json')
  objj_msgSend(request, "setHTTPMethod:", 'PUT')
  objj_msgSend(request, "setHTTPBody:",  jsonstring)
  objj_msgSend(request, "setValue:forHTTPHeaderField:", 'application/json', 'Accept')
  objj_msgSend(request, "setValue:forHTTPHeaderField:", 'application/json', 'Content-Type')
  updateConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
 } else {
  alert('Please provide a body and a title')
 }
}
},["@action","id"]), new objj_method(sel_getUid("removeSelectedItem:"), function $PostsController__removeSelectedItem_(self, _cmd, sender)
{ with(self)
{
 if (confirm('Are you sure you want to delete this item?'))
 {
  var request = objj_msgSend(CPURLRequest, "requestWithURL:", baseURL + '/posts/'+currentObject.id+'.json')
  objj_msgSend(request, "setHTTPMethod:", 'DELETE')
  objj_msgSend(request, "setValue:forHTTPHeaderField:", 'application/json', 'Accept')
  objj_msgSend(request, "setValue:forHTTPHeaderField:", 'application/json', 'Content-Type')
  deleteConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
 }
}
},["@action","id"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $PostsController__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 if (connection === listConnection) {
  var posts = objj_msgSend(Post, "initFromJSONObjects:", JSON.parse(data));
  objj_msgSend(postListCollectionView, "setContent:", posts);
  objj_msgSend(postListCollectionView, "setSelectionIndexes:", objj_msgSend(objj_msgSend(CPIndexSet, "alloc"), "initWithIndex:", 0) );
 } else {
   objj_msgSend(self, "loadPosts");
  }
}
},["void","CPURLConnection","CPString"])]);
}

e;