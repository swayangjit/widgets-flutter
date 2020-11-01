
##  Stateless Widget
`Stateless widgets` are used when the part of the UI is not changing dynamically i.e. it will have static content only and are immutable.

 - To create a Stateless Widget, you need to extend your class from  `StatelessWidget`  and you also need to override the  `build`  method that will return one or more widgets.
 - If there is a change in any of the variables associated with the Widgets, then the `build` method will not be called and nothing will be updated on the screen because it is `StatelessWidget`.