
  

##  Inherited widget

  

`InheritedWidget` is a special kind of widget that defines a context at the root of a sub-tree. It can efficiently deliver this context to every widget in that sub-tree. Classic example of `InheritedWidget` are following

 - `MediaQuery.of(context).size.width `
 - `Theme.of(context).indicatorColor`

**Important Notes:-**

 - The constructors should be `const` which will make  these widgets cacheable; thus increasing performance.
 - When the parameters get updated, a new  `InheritedWidget`  is built. However, unlike the other widgets, the subtree is  not rebuilt  Instead, Flutter keeps an internal registry that keeps track of widgets that have accessed this inherited widget and only rebuilds widgets that use this context.
 -  If the tree gets rebuilt due to a reason not related to the parameters such as orientation change,  `InheritedWidget`  is rebuilt. However, since the parameters are the same, widgets in the sub-tree would not be notified. This is purpose of the  `updateShouldNotify`  function implemented in  `InheritedWidget`.

**Good Practices**

 - **Keep `InheritedWidget` small.**
   
```
class  AppContext {
   int  teamId;
   String  teamName;
   String  highestScorer;
   String  highestScorerId;
}

```

Should be like divided inro smaller chunks of context
```
class  Teams {
   int  teamId;
   String  teamName;
}
```
```
class  HigestScorer {
  String  highestScorer;
   String  highestScorerId;
 }
 ```
- **Use const while initializing the widgets**
Without const, selective rebuilding of the sub-tree does not happen. Flutter creates a _new_ instance of each widget in the sub-tree and calls build() wasting precious cycles especially if your build methods are heavy.

- **Properly scope your inherited widgets**
Inherited widgets are placed at the root of a widget tree. That, in effect, becomes their scope. InheritedWidget should to accept only  `Scaffold`  (or its derivatives) as a child. That way, it will be ensured that the most granular context can be at the page level ending up with two types of scope:
-   App-scoped widgets such as  `MediaQuery`. These are accessible by  any  widget on any page in your app since they sit at the root of your app widget tree.
-   Page-scoped widgets such as the custom Inherited widget.