// This file is only used for Back4App

var myToken = "<my token here>";
Parse.Cloud.define("test", function(request, response) {
	return "Hello World";
});

Parse.Cloud.define("blogs", async function(request, response) {
    const query = new Parse.Query("blog");
    const results = await query.find();
	return results;
});

Parse.Cloud.define("delete-blog", async function(request, response) {
	authorize(request);
    const query = new Parse.Query("blog");
	query.equalTo("objectId", request.params.id);
	try {
		
    const result = await query.first();
	var resp = await Parse.Object.destroyAll(result, {useMasterKey: true});
	
	return resp;
	} catch (e) {
		return e;
	}
});

Parse.Cloud.define("update-blog", async function(request, response) {
	authorize(request);
    const query = new Parse.Query("blog");
	query.equalTo("objectId", request.params.id);
	try {
		const blog = await query.first();
		blog.set("title", request.params["title"]);
		blog.set("content", request.params["content"]);
		blog.save(null, {useMasterKey : true});
		return blog;
	} catch (e) {
		return e;
	}
});

Parse.Cloud.define("detail-blog", async function(request, response) {
    const query = new Parse.Query("blog");
	query.equalTo("objectId", request.params.id);
    try {
		const results = await query.first();
		return results;
	} catch (e) {
		return e;
	}
});

Parse.Cloud.define("add-blog", async function(request, response) {
	authorize(request);
	try {
		return new Parse.Object("blog", {
			"title": request.params["title"],
			"content": request.params["content"],
		}).save(null, { useMasterKey: true });
	} catch (e) {
		return e;
	}
});

function authorize(request) {
	var pwd = request.params.token;
	if (pwd !== myToken) {
		throw new Error("Unauthorized");
	}
}