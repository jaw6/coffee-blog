
@import <Foundation/CPObject.j>

@implementation PostsController : CPObject
{
  CPCollectionView        postListCollectionView @accessors;
  CPTextField             detailsView @accessors;

  CPString                baseURL;
  CPCollectionViewItem    currentObject;
  CPURLConnection         listConnection;
  CPURLConnection         addConnection;
  CPURLConnection         updateConnection;
  CPURLConnection         deleteConnection;
}

- (id)init
{
    if (self = [super init])
    {
        baseURL = "http://localhost:3000" ;
    }
    return self;
}

- (void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
    var selectedIndex   = [[collectionView selectionIndexes] firstIndex];
    currentObject = [[collectionView content] objectAtIndex:selectedIndex]
    
    [detailsView setStringValue:[currentObject body]];
}

- (void)loadExamplePosts
{
    var posts = [Post getExamplePosts] ;
    [postListCollectionView setContent:posts] ;
}

- (void)loadPosts
{
    var request     = [CPURLRequest requestWithURL:baseURL + "/posts.json"];
    [request setHTTPMethod: "GET"];
    listConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
}

-(@action) addItem:(id) sender
{

    var title = prompt("Enter the title") ;
    var body  = prompt("Enter the body") ;
    
    if (title!=="" && body!=="")
    {
        var JSONString = '{"post":{"title":"'+title+'","body":"'+body+'"}}'
        //var string = 'title='+title+'&body='+body;

        var request     = [CPURLRequest requestWithURL:baseURL + "/posts.json"];
        [request setHTTPMethod: "POST"];
        [request setHTTPBody: JSONString];
        [request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
        [request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;
        addConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
    }
    else
    {
        alert("Please provide a value for both title and body");
    }
}

-(@action) editSelectedItem:(id) sender
{
	var title = prompt('Modify the title', [currentObject title])
	var body  = prompt('Modify the body', [currentObject body])
	
	if (title !=='' && body !=='')
	{
		var json = {'post': {'title': title, 'body': body}}
		var jsonstring = JSON.stringify(json)
		var request = [CPURLRequest requestWithURL:baseURL+'/posts/'+[currentObject id]+'.json']
		[request setHTTPMethod:'PUT']
		[request setHTTPBody: jsonstring]
		[request setValue:'application/json' forHTTPHeaderField:'Accept']
		[request setValue:'application/json' forHTTPHeaderField:'Content-Type']
		updateConnection = [CPURLConnection connectionWithRequest:request delegate:self];
	} else {
		alert('Please provide a body and a title')
	}
}

-(@action) removeSelectedItem:(id) sender
{
	if (confirm('Are you sure you want to delete this item?'))
	{
		var request = [CPURLRequest requestWithURL:baseURL + '/posts/'+currentObject.id+'.json']
		[request setHTTPMethod:'DELETE']
		[request setValue:'application/json' forHTTPHeaderField:'Accept']
		[request setValue:'application/json' forHTTPHeaderField:'Content-Type']
		deleteConnection = [CPURLConnection connectionWithRequest:request delegate:self];
	}
}

- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)data
{
	if (connection === listConnection) {
		var posts   = [Post initFromJSONObjects:JSON.parse(data)];
		[postListCollectionView setContent:posts];
		[postListCollectionView setSelectionIndexes:[[CPIndexSet alloc] initWithIndex:0] ];
	} else {
  	[self loadPosts];
  }
}

@end
