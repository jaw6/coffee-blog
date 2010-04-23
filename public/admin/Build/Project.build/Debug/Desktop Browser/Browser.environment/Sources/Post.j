@STATIC;1.0;I;21;Foundation/CPObject.jt;3909;

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

