# The Io Programming Language

## Introduction
>The Io language’s syntax is simple and
low-level, like the name. Io syntax simply chains messages together,
with each message returning an object and each message taking optional parameters in parentheses. In Io, everything is a message that
returns another receiver.
With Io, you won't worry about both classes and objects. You'll deal exclusively in objects, cloning them as needed. These clones are called _prototypes_. Io is the **prototype based** programming language.
In a _prototype language_ , every objects is a clone of an existing object rather than a class.

## The Playground
### _Hello, world_ with Io
```
Io> "Hello, world" print
Hello, world==> Hello, world
```
We're sending the _print_ message to the string "Hello, world". **Receivers** is on the **left**, and **messages** go on the right. This method say: send _print_ command to object **Hello, world** string.

### Object Creation:
```
Io> Vehicle := Object clone
==>  Vehicle_0x4ebc058:
  type             = "Vehicle"
```
_Object_ is the root-level object. We send the **clone** message, which returns a new object. We assign that object to Vehicle. Here, _Vehicle_ is not
a class. It’s not a template used to create objects. It is an object, based
on the Object prototype.

_Object_ has slots. Think of the collection of slots as a hash. You’ll refer
to each slot with a key.
> Objects is a collection of slots

**Create new slot** in object by using  `<key_slot> := <data>` operator:
```
Io> Vehicle description := "Something takes you to places"
==> Something takes you to places
```

**Reassign slot** using `=` , io will throw exception if slot is not exist:
```
Io> Vehicle description = "It can moves !"
==> It can moves !
```

```
Io> Vehicle description1 = "It can moves !"
  Exception: Slot description1 not found. Must define slot using := operator before updating.
  ---------
  message 'updateSlot' in 'Command Line' on line 1
Io>
```
**Get slot** from object:
```
Io> Vehicle description
==> It can moves !
```


**List slots of object** with method `slotNames`:
```
Io> Vehicle slotNames
==> list(description, type)
```

Object has a slot to store the type of object
```
Io> Vehicle type
==> Vehicle
Io> Object type
==> Object
```

### Prototype and Inheritance
Create object _Car_ from _Vehicle_ object. We created a new object called `Car` by sending the `clone` message to the `Vehicle` prototype
```
Io> Car := Vehicle clone
==>  Car_0x4fd3570:
  type             = "Car"

Io> Car slotNames
==> list(type)
Io> Car type
==> Car
```






