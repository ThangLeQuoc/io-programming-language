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

Create another car `ferrari`, notice that this object start with lowercase character,
>Idiomatically, an object that begins
with an uppercase name is a type, so Io sets the type slot. Any clones of
that type starting with lowercase letters will simply invoke their parents’
type slot.
```
Io> ferrari := Car clone
==>  Car_0x4fccd60:
Io> ferrari slotNames
==> list()
Io> ferrari description
==> A vehicle with 4 wheels, run by gas
Io> ferrari type
==> Car
```

### Methods
Method is also an object with type `block`, syntax to create an assign a method to object slot is familiar
```
Io> Car horn := method("Piff Piff" println)
==> method(
    "Piff Piff" println
)
Io> Car horn
Piff Piff
==> Piff Piff
```

The subclass can execute the method of parent object
```
Io> ferrari horn
Piff Piff
==> Piff Piff
```

>• Every thing is an object.
• Every interaction with an object is a message.
• You don’t instantiate classes; you clone other objects called prototypes.
• Objects remember their prototypes.
• Objects have slots.
• Slots contain objects, including method objects.
• A message returns the value in a slot or invokes the method in a
slot.
• If an object can’t respond to a message, it sends that message to
its prototype.

### List and Map
Create an empty list: `todos := List clone`

Create list using method: `todos := (33, "jump")`

Get list size: `todos size`

Append an item: `todos append("kick")`

Get item at index: `todos at (1)`

Pop item: `todos pop`

Prepend item:
```
Io> Action = list("Hit", "Kick", "Dash")
==> list(Hit, Kick, Dash)
Io> Action size
==> 3
Io> Action append("Punch")
==> list(Hit, Kick, Dash, Punch)
Io> Action at (2)
==> Dash
Io> Action pop
==> Punch
```

### Commonly used messages
| Message          | Description         | Example                  |
| ---------------- |:-------------------:| ------------------------:|
| `clone`          | Create object       | `Vehicle := Object clone` |
| `slotNames`      | List all slots      |   `Car slotNames` |
| `getSlot`      | List all slots      |   `Car slotNames` |
| `proto`      | List all slots      |   `Car slotNames` |
| `Lobby`      |       |    |









