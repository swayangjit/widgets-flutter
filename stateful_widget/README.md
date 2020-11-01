
##  Stateful widget

`Stateful Widgets` are used when the part of the UI changes dynamically i.e. when we have mutable widgets then we use  `Stateful Widget`.

To create a `Stateful Widget`, you need to extend your class from  `StatefulWidget` and here instead of overriding the  `build`  method, you need to override the  `createState()`  method. The  `createState()`  method returns a  `State`object. Then we create another class that is extended from  `State`  and here in this class, we need to override the  `build`  method and this  `build`  method will return one or more widgets.