@STATIC;1.0;I;21;Foundation/CPObject.jt;5786;


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

