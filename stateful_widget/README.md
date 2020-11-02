
  

##  Stateful widget

  

`Stateful Widgets` are used when the part of the UI changes dynamically i.e. when we have mutable widgets then we use `Stateful Widget`.

  

- To create a `Stateful Widget`, you need to extend your class from `StatefulWidget` and here instead of overriding the `build` method, you need to override the `createState()` method. The `createState()` method returns a `State`object. Then we create another class that is extended from `State` and here in this class, we need to override the `build` method and this `build` method will return one or more widgets.

  
- The advantage of overriding the `build` method in `MyAppState` is that now the build method will be called whenever there is a change in the variables associated with the Widgets present in it and the whole widget will be redrawn once again. But in order to call the `build` method, you need to add another method called `setState()` that will call the `build` method whenever there is a change in the state.