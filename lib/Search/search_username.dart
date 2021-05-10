

import 'package:flutter/material.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/Profile/PostTabs.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/view_post_screen.dart';

import 'package:google_fonts/google_fonts.dart';




import '../constants.dart';
import '../textStyle.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Search'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle_rounded), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          }),
          IconButton(icon: Icon(Icons.location_on_outlined), onPressed: () {
            showSearch(context: context, delegate: DataSearch2());
          }),
          IconButton(icon: Icon(Icons.content_paste_outlined), onPressed: () {
            showSearch(context: context, delegate: DataSearch3());
          }),

        ],
      ),
      body: Card(
        color: kPrimaryColor,
        shape: CircleBorder(),
        child: Center(
            child: Text(

              'Search for user/location/content from IconButtons right above',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: stylePost,
                color: Colors.yellowAccent,
              ),
            )

        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  String getQ(String which)
  {
    return which;
  }




  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  } //second press geri don

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon:AnimatedIcons.menu_arrow ,progress: transitionAnimation), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context)
  {
    int count = 0;
    int index = 0;

    for (var i in users)
    {
      if(i.username == query)
      {
        index = count;
        break;
      }
      else {
        count++;
      }

      print('$count');
      index = count;
    }
    print("${index}");
    if(index >= users.length)
    {
      //showAlertDialog('Ups', 'There is no product called $query');
      return Card(
        color: kPrimaryColor,
        shape: CircleBorder(),
        child: Center(
            child: Text(

              'Sorry we do not have ${query}',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: stylePost,
                color: Colors.yellowAccent,
              ),
            )

        ),
      );

    }
    return ViewProfileScreen(user: users[index]);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?users:
    //_products.where((q) => q.description.startsWith(query)).toList();
    users.where((p) => p.username.startsWith(query)).toList();


    return ListView.builder(itemBuilder: (context,index) => ListTile(
      onTap: (){
        print("$index");
        query = suggestionList[index].username;

        showResults(context);
      },
      leading: Icon(Icons.account_circle_rounded),
      title: RichText(
        text: TextSpan(
            text: suggestionList[index].username.substring(0,query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggestionList[index].username.substring(query.length),
              style: TextStyle(color: Colors.grey),
            )]

        ),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }

}


class DataSearch2 extends SearchDelegate<String> {



  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  } //second press geri don

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon:AnimatedIcons.menu_arrow ,progress: transitionAnimation), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context)
  {

    int count = 0;
    int index = 0;
    int count2 = 0;
    List <int> indices = [];

    for (var i in posts)
    {
      if(i.location.state == query)
      {
        index = count;
        indices.add(count);
        count2++;
        count++;
      }
      else {
        count++;
      }

      print('$count');
      //index = count;
    }

    print("${index}");
    if(index >= posts.length)
    {
      //showAlertDialog('Ups', 'There is no product called $query');
      return Card(
        color: kPrimaryColor,
        shape: CircleBorder(),
        child: Center(
            child: Text(

              'Sorry we do not have ${query}',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: stylePost,
                color: Colors.yellowAccent,
              ),
            )

        ),
      );
    }
    List <Post> posts2 = [];
    for(int i = 0; i < indices.length ; i++)
      {
        print("${indices.length}, dhalsda1");
        print('${indices[i]}, sadhasldksah');
        //posts2[i] = posts[indices[i]];
        posts2.add(posts[indices[i]]);
      }

    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: posts2.map((post) => PostCard(
        post: post,
      )).toList(),
    );


      //ViewPostScreen(post: posts[index]);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?posts:
    //_products.where((q) => q.description.startsWith(query)).toList();
    posts.where((p) => p.location.state.startsWith(query)).toList();


    return ListView.builder(itemBuilder: (context,index) => ListTile(
      onTap: (){
        print("$index");
        query = suggestionList[index].location.state;

        showResults(context);
      },
      leading: Icon(Icons.location_on_outlined),
      title: RichText(
        text: TextSpan(
            text: suggestionList[index].location.state.substring(0,query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggestionList[index].location.state.substring(query.length),
              style: TextStyle(color: Colors.grey),
            )]

        ),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }

}





class DataSearch3 extends SearchDelegate<String> {
  String getQ(String which)
  {
    return which;
  }




  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  } //second press geri don

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon:AnimatedIcons.menu_arrow ,progress: transitionAnimation), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context)
  {
    Future <void> showAlertDialog(String title, String msg) async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(msg),
                    ],
                  )
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  } ,
                )
              ],

            );
          }

      );
    }






    int count = 0;
    int index = 0;
    int count2 = 0;

    List <int> indices = [];

    for (var i in posts)
    {
      if(i.content == query)
      {
        index = count;
        indices.add(count);
        count2++;
        count++;
      }
      else {
        count++;
      }

      print('$count');
      //index = count;
    }
    if(index >= posts.length)
    {
      //showAlertDialog('Ups', 'There is no product called $query');
      return Card(
        color: kPrimaryColor,
        shape: CircleBorder(),
        child: Center(
            child: Text(

              'Sorry we do not have ${query}',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: stylePost,
                color: Colors.yellowAccent,
              ),
            )

        ),
      );

    }

    List <Post> posts2 = [];
    for(int i = 0; i < indices.length ; i++)
    {
      print("${indices.length}, dhalsda1");
      print('${indices[i]}, sadhasldksah');
      //posts2[i] = posts[indices[i]];
      posts2.add(posts[indices[i]]);
    }

    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: posts2.map((post) => PostCard(
        post: post,
      )).toList(),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?posts:
    //_products.where((q) => q.description.startsWith(query)).toList();
    posts.where((p) => p.content.startsWith(query)).toList();


    return ListView.builder(itemBuilder: (context,index) => ListTile(
      onTap: (){
        print("$index");
        query = suggestionList[index].content;

        showResults(context);
      },
      leading: Icon(Icons.account_circle_rounded),
      title: RichText(
        text: TextSpan(
            text: suggestionList[index].content.substring(0,query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggestionList[index].content.substring(query.length),
              style: TextStyle(color: Colors.grey),
            )]

        ),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }

}



