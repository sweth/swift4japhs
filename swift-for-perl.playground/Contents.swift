//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/* The stuff above this line comes with every new playground... */

/******************************/
/*      INTRO INFORMATION     */
/******************************/

/* Swift uses double-slash inline comments and slash-star multiline comments */

/* TINHPDI == This Is Not How Perl Does It.  I'll try to flag new/different concepts with that label
   before giving an example of them.  For example...
 */

/* TINHPDI: The development environment and the code are pretty tightly coupled.
   You can code Swift without XCode but it is much easier if you don't.
   So: so much for your preferred text editor.
   (I assume EMacs has an XCode mode, because Emacs.)
 */

/* In particular, XCode's playgrounds (of which this is an example) are a great way to learn Swift, so
   let's start with a very quick tour of the playground UI itself.
 */

/* Code & Comments go in this center top area (the Editor area) */

/* <--- To the immediate left (still within this Editor area) is a vertical status bar.  If XCode detects an error
   in your code, it will flag the problematic line(s) in red in the status bar. */

/* <<<--- To the far left is the Navigator area.
   If it isn't there, use cmd-0 or View->Navigators->Show Navigator or the leftmost button in the upper
   right corner of the app.
   Use cmd-1 through cmd-8 to switch between navigators, or View->Navigators
 */

/* To the right is the Results sidebar, which shows the "textual representation" of the value of each
   statement as it is executed.                                                                  --->

   If you hover over a line of code, the Results sidebar will let you Quick View the statement's value
   (the eye logo) or Results View that value (the circle); these views are often textual representations
   but can be graphical when that makes more sense.
   * Results Sidebar shows a summary for code that is evaluated multiple times (e.g. functions and loops).
   * Quick View shows the latest value as a pop-up, including multiple values for tuples.
     Useful when values are things like an image.
   * Results View shows the value inline with the code, and can show the latest value
     OR a history of values.
 
   When text in the Results Sidebar or a Results View / Quick View is grey, that means that it is "old" text, and
   XCode is waiting for you to finish making changes so that it can re-execute the playground and give you new results.)
 
   Tip: if results/quick view are grey and you are not making changes, then you probably have an error somewhere so
   XCode couldn't finish re-executing the playground.
 */

/* To the far right is the Utilities area, which has a File Inspector that shows info like (GIT-aware)
   source control status, plus some other useful tools when you are in a real XCode project rather than
   a playground, as well as a Quick Help mode that lets you look up documentation on language elements.
   If it isn't there, use the rightmost button in the upper right to reveal it.
 */

/* vvv At the bottom is the Debug Console.  Think of it as stdout / stderr combined, with XCode emitting lots of
   warnings to stderr that show up there, as well as doing in-line markup in red when errors are found.
   Annoyingly, Debug Console doesn't always update to show errors, so you sometimes have to scroll around in a
   playground looking for the in-line markup, especially if the error is an unclosed comment. vvv 
 */

/* In this playground, any full line of code commented with // is something that would trigger
   an error.  If we leave those uncommented, then the Results sidebar doesn't update, and Quick
   Views and Results Views aren't generated.  Uncomment/recomment them one at a time to see the
   relevant errors.
 
   I'm also using //? for placeholders for things I want to flesh out later.  Don't uncomment those, as they are
   probably not functional code or even code at all.
 */

/* I put terminology that I use but that aren't officially defined in the docs in quotes, e.g. the Swift docs define
   Named Types, so that isn't in quotes, but even though the docs make a conceptual distinction at times between
   things like Bool and Int vs. things like Class and Struct, they don't give those distinctions official definitions,
   so I refer to them here as "Primitive" Types and "Extended" Types respectively.
 */

/* TINHPDI: Swift's print is like Perl's say on steroids; it includes newline by default.  More on print later. */
print(str)
/* TINHPDI: \(string) to interpolate parameters into strings in Swift.  More on \() later, too. */
print("\(str)!")
/* TINHPDI: *everything* needs parens in Swift. "consecutive statements on a line need ;" error often means missing parens.
   Uncomment the next line to let XCode point out your error.
 */
// print str

/*********************************/
/*     Parameters and Objects    */
/*********************************/

/* TINHPDI: Every parameter is explicitly a Constant or a Variable */

/* Constants (Immutable parameters) vs Variables (Mutable parameters) */
let constantString = "this is a constant"
var variableString = "this is a variable"
/* TINHPDI: XCode will offer to fix errors for you -- uncomment the line below see what happens */
// constantString = "can I change this constant?"
variableString = "how about this variable?"
// var variableString = "since it is not a constant, can I define this variable twice?"

/* TINHPDI: Everything is strongly typed. */

/* Everything has a type.  It can be a Named Type or a Compound Type.
   * Named Types include:
     * "Primitive" Types: Bool, String, Int, Float, and Double
     * Collection Types: Array, Set, Dictionary
     * "Extended" Types such as Struct, Class, Enum, or Protocol, as well as user-defined Named Types
   * Compound Types are:
     * Tuples
     * Functions
 */

/* Primitive Types: Bool / String / Int / Float / Double */

/* Booleans */
let explicitBool: Bool = true // declare constant as Bool via "type annotation", and assign a Bool to it
let implicitBool = true // declare constant, implicitly cast as a Bool, and assign a Bool to it

/* Swift has a lot of things that exist for compat with "historic" C and Obj-C */
let historicCBool: DarwinBoolean = true
let objCBool: ObjCBool = true
/* DarwinBoolean was called Boolean in earlier versions of Swift, and confusion between Bool and Boolean
   caused problems.  Swift 2 renamed the historic one, but XCode suggests correcting Boolean to DarwinBoolean
   rather than to Bool, which is almost never the right choice...
 */
// let notABool: Boolean = true

/* Strings */
var implicitString = "foo"
var explicitString: String = "foo"
// explicitString = 1 // Cannot assign an Int to a String
// implicitString = 1 // Doesn't matter if initial declaration used explicit or implicit Type
/* TINHPDI: Everything is an object, with methods you can call */
var emptyString = ""
if emptyString.isEmpty {
    print("emptyString is empty!")
}
if implicitString.isEmpty {
    print("implicitString is empty!") // Note how the Results sidebar is blank for this line as it is not evaluated
}
/* Cool XCode features!
 You can also option-click and command-click on parameters to see useful info about them and/or change them
 in cool ways.
 * For example, option-click on "anotherImplicitString" below to see that the declaration
   is being translated to "var anotherImplicitString: Bool" (rather than as a String) well as which file it
   is declared in.
 * Using option-click on other language elements like "Bool" or "String" give you "quick help" on those
   elements, as if you were viewing that element in the Utilities->Quick Help panel mentioned at the beginning.
 * Then command-click on the "implicitBool" below to be taken to the place where it is in fact declared,
   as well as subtly highlighting every instance of that parameter that is in the current scope.
 * Once a parameter declaration is selected via command-click, hold down command and hover over the declaration
   or any of the highlighted mentions in-scope. A dropdown menu triangle will appear to the right of the parameter
   name; selecting it will give you access to the OSX Services menu, as well as offering an option to "Edit All
   In Scope".  The latter lets you edit the parameter name in one place, and have the change propogate to every
   other instance of the parameter within the same scope
 */
var anotherImplicitString = implicitBool // oops!


/* Numbers -- Int, Float, and Double */
let explicitInt: Int = 99
let implicitInt = 99
// let explicitInt: Int = 99.9
let explicitFloat: Float = 99.9
let explicitDouble: Double = 99.9 // note that it evaluates to 99.90...01  --->
let implicitDouble = 99.9 // implicitly cast as a double, which you can tell because of that same 99.90...01 --->
let cannotDirectlyGetAnImplicitFloat = 99.9 // Swift assumes Double rather than Float, so again, 99.90...01 --->
let implicitFloatViaConversion = Float(99.9) // more on conversion later

/* TINHPDI: Other than initial implicit casting of types, Swift almost never DWIM. */

let intThree = 3
let doublePointOneFourOneFiveNine = 0.14159
// let naiveEightTimesNine = intEight * stringNine
// let naiveFakePi = intThree + doublePointOneFourOneFiveNine
let fakePi = Double(intThree) + doublePointOneFourOneFiveNine

/* Collection Types: Array / Set / Dictionary */
 
/* TINHPDI: Declaring an object as being of a Collection Type means declaring the Type of the object, and
   also the type of its contents */
 
/* Arrays -- ordered collection of objects of the same type*/
var explicitStringArray = ["one", "two", "three"]
print(explicitStringArray[0]) // arrays are 0-based

/* Mutable vs Immutable Collections -- collections defined with var can change their contents, but *not* the
   Type of their contents; collections defined with let cannot change at all */
var variableArray = ["one", "two", "three"]
let constantArray = variableArray
variableArray = ["foo"]
// variableArray = [1]
// constantArray = ["foo"]

/* TINHPDI: scalar(@array) => .count method */
print(explicitStringArray.count)
/* .capacity is under-the-hood peek at number of array elements for which mem is allocated.  Usually same as .count but don't use it as a proxy for .count */
print(explicitStringArray.capacity)
/* TINHPDI: negative array indices not allowed; use .last or arithmetic on .count methods of array */
// print(explicitStringArray[-1])
print(explicitStringArray[explicitStringArray.count - 1])
print(explicitStringArray.last)

/* TINHPDI: no direct equivalent of full-featured splice().  Must use piecemeal tools below... */

/* TINHPDI: pop() => .removeLast */
var tmpArray: [String]
tmpArray = explicitStringArray
var poppedValue = tmpArray.removeLast()
tmpArray.removeLast() // As with .pop, we don't need to do anything with returned value if goal is just to remove last value

/* TINHPDI: push() => +=, or .append */
tmpArray+=["Something Else"]
// tmpArray+="Yet another something"
/* ^^^ Note that you can only append an array literal (with square brackets) to an array.
 The error message generated refers to converting a value of type '[String]' to 'inout String',
 because by default the += operator is a string concat operator--based on its RHS being a string,
 it is expecting what it sees on its LHS to be a string, not an array of strings like tmpArray.
 */
tmpArray+=["element1", "element2"] // += can append multiple elements, as long as they are part of one array literal argument
// tmpArray+=["element3, ["element4", "element5"]] // however, all elements must still have same type, so cannot dynamically create a nested object.
tmpArray.append("something")

/* TINHPDI: most splice() equivs in Swift only take one arg:
   unlike +=, array methods all take argument of appropriate Type object (rather than array literal) so cannot insert/append/remove multiple elements at once
 */
// tmpArray.append("arg1", "arg2")

/* splice to insert/unshift => .insert */
tmpArray.insert("foobar", atIndex: 0) // unshift
// tmpArray.insert(["foo", "bar"], atIndex: 0) // again, only one element at a time

/* splice to remove/shift => .removeAtIndex */
tmpArray.removeAtIndex(0)

/* clear array via assignment of empty literal, or .removeAll*/
tmpArray = []
tmpArray = explicitStringArray
tmpArray.removeAll() // removeAll has keepCapacity optional arg to prevent deallocation of memory


/* TINHPDI: no autovivification of array elements */
tmpArray = ["foo"] // only tmpArray[0] exists
// tmpArray[1] = "something" // inline error is EXC_BAD_INSTRUCTION, but debug console gives real error of "Index out of range"


/* Sets -- unordered collection of objects of the same Type */
//? Set<Element>
//? var letters = Set<Character>()
//? letters.insert("a")
//? letters = []
/* TINHPDI: use a Set rather than a Hash to ensure unique values if there are not natural key-value pairs */

/* Dictionaries -- unordered collection of key-value pairs, where keys all have same Type, and values all have same Type */

/* Extended Types: Struct, Class, Enum, Protocol, and ANYTHING ELSE YOU WANT OR THAT LIBS PROVIDE */

/* notice how XCode's text eval of a UIImage is its dimensions */
var imageOne = UIImage(named: "clownshoe.jpg")
/* exercise for the reader: drag surprise.jpg from the Images folder in this repo into the Resources folder in this playground, and assign it to a var.  notice how as you type the relevant code, XCode gives you syntax hints and will auto-complete if you let it. */

/* Compound Types: Tuples & Functions */
/* Tuples -- ordered list of objects where Type of each position in list can be declared to be different */

var implicitIntIntTuple = (1,2) // declare as an ordered pair, both positions implicitly cast as integers, and assigns two integers to it
/* ^^^ Note that the Results views for a tuple gives indices as well as values.
 But note that you can Quick View any item in the results View above to get just the value
 */
var implicitIntStringTuple = (1, "one") // declare as an ordered pair, first implicitly as Int, second implicitly as String, and assigns
var explicitIntStringTuple: (Int, String)
explicitIntStringTuple = (2, "two")
// explicitIntStringTuple = (2, 2)
/* The line below declares an (Int, Tuple), where the Tuple is an (Int, String); i.e. the line implicitly declares an (Int, (Int, String)) */
var implicitNestedTuple = (1, explicitIntStringTuple)
/* ^^^ Results view for a nested data struct lets you drill down... */

var explicitNestedTuple: (Int, (Int, String)) = (1, (2, "three"))
// implicitNestedTuple = (1, 2) // Can't assign (Int, Int) to (Int, (Int, String))
/* ^^^ If you uncommment the line above, the error will say something like
 "failed: filename:linenum:charnum: error: cannot assign value of type 'Int' to type '(Int, String)'".
 It might seem confusing at first, because you are trying to assign to an (Int, Tuple), not an (Int, String).
 
 You are actually assigning an (Int, Int) to an (Int, (Int, String)), though, or looked at another way, you
 are assigning the first Int to an Int, and then the second Int to the (Int, String) Tuple; the first assignment
 succeeds, and so the error is only for the attempt to assign the second Int to that Tuple.
 
 Some indicators of the fact that the problem is with the second assignment are that both the Debug Console and the
 in-line error markup put a caret under the problematic second Int, and also that the Debug Console gives you a
 character position on the line that also references that second Int.
 */

 
/* Type Conversion */
//? if let castDouble = Double(explicitFloat) { thing }
//? String(explicitDouble)
let stringFromInt = String(explicitInt)
let stringFromDouble = String(Double(explicitInt)) // note the trailing ".0" added when stringifying from a Double/Float
let stringFromFloat = String(Float(explicitInt)) // note the trailing ".0" added when stringifying from a Double/Float

/*********************************/
/*     Tests and Comparisons     */
/*********************************/

/* Comparisons */
explicitInt == implicitInt // a no-op, but as in Perl, it evaluates to true
/* TINHPDI: cannot compare things of different types */
// explicitInt == explicitDouble

/************************/
/*     Flow Control     */
/************************/

/* Flow Control */
//? if / else if / else
//? switch / case / break / default ***
//? Results view history of values

/*********************/
/*     Functions     */
/*********************/


/* Function names behind the scenes are indexed by name as well as number of arguments */
func myFunc(arg1: String) -> String { return arg1 } // defines a function named myFunc(_:)

/* ^^^ Results sidebar for this lists the number of times the function is evaluated, while Quick View shows the results of
   each evaluation.  Results View shows result of last evaluation by default, but can right-click to get results of each
   evaluation there as well. 
 */

//func myFunc(arg1: String) -> String { return arg1 }
myFunc("one")
myFunc("two")

/* this defines a function named myfunc(_:arg2) -- different name so no redeclaration error */
func myFunc(arg1: String, arg2: String) -> String { return arg1 + arg2 }

//myFunc(1);
myFunc("one");
//myFunc("one", "two");
myFunc("one", arg2: "two");

/* this defines a function named myFunc(a:) */
func myFunc(a arg1: Int) -> String { return "a is \(arg1)" }
myFunc("one");
myFunc(a: 1);
//myFunc(arg1: "one");

/************************/
/*     Misc to sort     */
/************************/

struct HelloWorld {
    static func hello_testNoName( ) -> String { return "Hello, World!" } // cannot be overridden by child
    //    class func hello_testNoName2( ) -> String { return "Hello, World!" } // can be overridden by child
}

//static func hello_testNoName( ) -> String { return "Hello, World!" }


//func hello_testNoName( ) -> String { return "Hello, World!" }

/* Concatenation, Interpolation */

/* TINHPDI: string interpolation is the same for almost all types, and drills down so Data::Dumper equivalents are
 not as relevant. */
/* TINHPDI: interpolation includes some of what perl does via eval... */
print("\\() notation works on most parameter Types: Bool -> \(explicitBool)")
print("\\() notation works on most parameter Types: String -> \(explicitString)")
print("\\() notation works on most parameter Types: Int -> \(explicitInt)")
print("\\() notation works on most parameter Types: Float -> \(explicitFloat)")
print("\\() notation works on most parameter Types: Double -> \(explicitDouble)")
print("\\() notation works on most parameter Types: IntStringTuple -> \(explicitIntStringTuple)")
print("\\() notation works on most parameter Types: Nested Tuple -> \(explicitNestedTuple)")
// print("\(HelloWorld)") // nope
// print("\(myFunc)") // nope.
// print(myFunc(a: <#T##Int#>)) // nooope.

/* TINHPDI: String concat is +, not .  Similarly, string append is +=, not .= */
print("Hello" + " " + "world!")

//? optional types /* TINHPDI: By default no parameter can be undefined */
//? ?? operator
//? if-let vs guard
//? decompose tuples -- let (statusCode, statusMessage) = http404Error
//? ignore decomposed elements with _ -- let (firstName, _, lastName) = firstMiddleLastNames

